//
//  JobOfferListViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import MBProgressHUD
enum OfferDataSourceType {
    case all, favour
}
class JobOfferListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Attributes
    var offers = [Offer]()
    var dataSourceType = OfferDataSourceType.all
    
    
    
    //UI
    lazy var hud: MBProgressHUD = {
        let _hud = MBProgressHUD(view: self.view)
        return _hud
    }()
    lazy var refreshController: UIRefreshControl = {
        let _refreshController = UIRefreshControl()
        _refreshController.addTarget(self, action: #selector(JobOfferListViewController.fetchData), for: .valueChanged)
        return _refreshController
    }()
    lazy var tableView: UITableView = {
        let _tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.refreshControl = self.refreshController
        _tableView.register(OfferTableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    //Life
    init(type:OfferDataSourceType? = .all) {
        super.init(nibName: nil, bundle: nil)
        
        if type == .favour {
            title = "我的收藏"
            self.dataSourceType = .favour
        }else {
            title = "招聘信息"
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        
        
        

        
        view.addSubview(tableView)
        view.addSubview(hud)
        
        fetchData()
    }
    
    //Network
    
    func fetchData()  {
        var url = "\(BASE_URL)/api/offers"
        if dataSourceType == .favour {
            url = "\(BASE_URL)/api/offers/favours"
        }
        CollectionService<Offer>.get(url) { (offers, error) -> (Void) in
            if error != nil {
                logInfo(error)
                switch error! {
                case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                case .noContent:
                    HudHelper.show(hud: self.hud, text: "没有数据了")
                default:
                    break
                }
                self.offers.removeAll()
                self.tableView.reloadData()
                self.refreshController.endRefreshing()
            }else {
                self.offers = offers
                self.tableView.reloadData()
                self.refreshController.endRefreshing()
            }
        }
    }
    
    func favourOffer(offer: Offer) {
        NetWorkService.shared.request(.get, url: "\(BASE_URL)/api/offers/\(offer.id)/favour", paramters: nil) { (response, error) -> (Void) in
            if error != nil {
                switch error! {
                case .unAuth :
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    self.hud.mode = .text
                    self.hud.label.text = response?.value(forKey: "error") as! String?
                    self.hud.show(animated: true)
                    self.hud.hide(animated: true, afterDelay: 2)
                    break
                }
            }else {
                self.hud.mode = .text
                self.hud.label.text = response?.value(forKey: "message") as! String?
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
                self.fetchData()
            }
        }
    }
    //Action

    //table delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OfferTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.offers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OfferTableViewCell
        //config
        let offer = self.offers[indexPath.row]
        cell.config(offer: offer)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let offer = self.offers[indexPath.row]
        let detailVC = JobOfferDetailViewController(offer: offer)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if dataSourceType == .favour {
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if dataSourceType == .favour && editingStyle == .delete {
            let offer = offers[indexPath.row]
            favourOffer(offer: offer)
            
            
        }
    }
}
