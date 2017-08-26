//
//  JobOfficeDetailViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import MBProgressHUD
class JobOfferDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var offer: Offer
    var comments = [Comment]()
    let resumeService = ResumeService()
    
    //UI
    lazy var hud: MBProgressHUD = {
        let _hud = MBProgressHUD(view: self.view)
        return _hud
    }()
    
    lazy var headerView: OfferDetailHeaderView = {
        let height = self.offer.detail.heightWithConstrainedWidth(width: SCREEN_WIDTH-40, font: UIFont.systemFont(ofSize: T1)) + 120
        
        let _headerView = OfferDetailHeaderView(frame: CGRect(x: 0, y:0, width: SCREEN_WIDTH, height: height), offer: self.offer)
        return _headerView
    }()
    
    lazy var tableView: UITableView = {
        let _tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 44 - 64))
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "cell")
        _tableView.tableHeaderView = self.headerView
        return _tableView
    }()
    
    lazy var postResumeButton: UIButton = {
        let _postResumeButton = UIButton(frame: CGRect(x: 0, y: SCREEN_HEIGHT-44, width: SCREEN_WIDTH/3.0, height: 44))
        _postResumeButton.backgroundColor = .blue
        _postResumeButton.setTitle("投递简历", for: .normal)
        _postResumeButton.setTitleColor(.white, for: .normal)
        _postResumeButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _postResumeButton.addTarget(self, action: #selector(JobOfferDetailViewController.openResumeVC), for: .touchUpInside)
        return _postResumeButton
    }()
    
    lazy var commentButton: UIButton = {
        let _commentButton = UIButton(frame: CGRect(x: SCREEN_WIDTH/3, y: SCREEN_HEIGHT-44, width: SCREEN_WIDTH/3.0, height: 44))
        _commentButton.backgroundColor = .green
        _commentButton.setTitle("马上留言", for: .normal)
        _commentButton.setTitleColor(.white, for: .normal)
        _commentButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _commentButton.addTarget(self, action: #selector(JobOfferDetailViewController.pushToCommentVC), for: .touchUpInside)
        return _commentButton
    }()
    
    lazy var favourButton: UIButton = {
        let _favourButton = UIButton(frame: CGRect(x: SCREEN_WIDTH/3*2, y: SCREEN_HEIGHT-44, width: SCREEN_WIDTH/3.0, height: 44))
        _favourButton.backgroundColor = .red
        _favourButton.setTitle("收藏", for: .normal)
        _favourButton.setTitleColor(.white, for: .normal)
        _favourButton.titleLabel?.font = UIFont.systemFont(ofSize: T1)
        _favourButton.addTarget(self, action: #selector(JobOfferDetailViewController.favourOffer), for: .touchUpInside)
        return _favourButton
    }()
    
    init(offer: Offer) {
        self.offer = offer
        super.init(nibName: nil, bundle: nil)
        title = offer.title
        automaticallyAdjustsScrollViewInsets = false
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(tableView)
        view.addSubview(postResumeButton)
        view.addSubview(commentButton)
        view.addSubview(favourButton)
        view.addSubview(hud)
        
        let rightItem = UIBarButtonItem(title: "公司新闻", style: .done, target: self, action: #selector(JobOfferDetailViewController.pushToNewsListVC))
        navigationItem.rightBarButtonItem = rightItem
        
        fetchData()
    }
    
    //Network
    func fetchData() {
        CollectionService<Comment>.get("\(BASE_URL)/api/offers/\(offer.id)/comments") { (comments, error) -> (Void) in
            if error != nil {
                logInfo(error)
            }else {
                self.comments = comments
                self.tableView.reloadData()
            }
        }
    }
    
    //Action
    func pushToNewsListVC()  {
        if let user = offer.user {
            let newsListVC = NewsListViewController(user: user)
            navigationController?.pushViewController(newsListVC, animated: true)
        }else {
            print("Offer数据错误")
        }
    }
    
    func openResumeVC()  {
        let resumeListVC = ResumeListViewController { (resumeId) in
            self.sendResume(resumeId: resumeId)
        }
        let resumeNavVC = UINavigationController(rootViewController: resumeListVC)
        resumeNavVC.navigationBar.barTintColor = .blue
        resumeNavVC.navigationBar.barStyle = .default
        resumeNavVC.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont.systemFont(ofSize: T1)
        ]
        self.present(resumeNavVC, animated: true, completion: nil)
    }
    
    func sendResume(resumeId: Int)  {

        resumeService.send(offerId: offer.id, resumeId: resumeId) { (error) -> (Void) in
            if error != nil {
                switch error! {
                    case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    self.hud.mode = .text
                    self.hud.show(animated: true)
                    self.hud.label.text = error!.description
                    self.hud.hide(animated: true, afterDelay: 2)
                    break
                }
            }else {
                self.hud.mode = .text
                self.hud.show(animated: true)
                self.hud.label.text = "投递成功"
                self.hud.hide(animated: true, afterDelay: 2)
            }
        }
    }

    func favourOffer() {
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
            }
        }
    }
    
    func pushToCommentVC()  {
        let commentVC = CommentViewController(offer: self.offer)
        navigationController?.pushViewController(commentVC, animated: true)
    }
    
    //table delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OfferTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell
        //config
        let comment = comments[indexPath.row]
        cell.config(comment: comment)
        return cell
    }

}
