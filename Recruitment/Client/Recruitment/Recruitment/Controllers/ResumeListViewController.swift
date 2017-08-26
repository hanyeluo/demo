//
//  ResumeListViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
import MBProgressHUD

typealias FinishSelectResumeClousure = (_ resumeId: Int) -> Void


class ResumeListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var resumes = [Resume]()
    let service = ResumeService()
    var finishSelectResume: FinishSelectResumeClousure?
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
        _tableView.register(ResumeTableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    //Life
    init(finishSelect: FinishSelectResumeClousure? = nil) {
        self.finishSelectResume = finishSelect
        super.init(nibName: nil, bundle: nil)
        title = "我的简历"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if finishSelectResume != nil {
            let leftItem = UIBarButtonItem(title: "关闭", style: .done, target: self, action: #selector(ResumeListViewController.dismissVC))
            navigationItem.leftBarButtonItem = leftItem
        }
        
        
        let rightItem = UIBarButtonItem(title: "创建", style: .done, target: self, action: #selector(ResumeListViewController.pushToCreateResumeVC))
        navigationItem.rightBarButtonItem = rightItem
        view.addSubview(tableView)
        view.addSubview(hud)
        fetchData()
    }
    
    //MARK: - Action
    func dismissVC()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    //network
    func fetchData()  {
        CollectionService<Resume>.get("\(BASE_URL)/api/resumes") { (resumes, error) -> (Void) in
            if error != nil {
                switch error! {
                case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    self.hud.mode = .text
                    self.hud.label.text = error?.description
                    self.hud.show(animated: true)
                    self.hud.hide(animated: true, afterDelay: 2)
                    break
                }
                self.resumes.removeAll()
                self.tableView.reloadData()
                self.refreshController.endRefreshing()
            }else {
                self.resumes = resumes
                self.tableView.reloadData()
                self.refreshController.endRefreshing()
            }
        }
    }
    
    func pushToCreateResumeVC()  {
        let createResumeVC = EditResumeViewController()
        navigationController?.pushViewController(createResumeVC, animated: true)
    }

    func deleteResume(resume: Resume)  {
        service.delete(resume: resume) { (error) -> (Void) in
            if error != nil {
                switch error! {
                case .unAuth:
                    RouteHelper.presentLoginVC(viewController: self, completion: nil)
                default:
                    self.hud.mode = .text
                    self.hud.label.text = error?.description
                    self.hud.show(animated: true)
                    self.hud.hide(animated: true, afterDelay: 2)
                    break
                }

            }else {
                self.hud.mode = .text
                self.hud.label.text = "删除成功"
                self.hud.show(animated: true)
                self.hud.hide(animated: true, afterDelay: 2)
                self.fetchData()
            }
        }
    }

    //tableview
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let resume = resumes[indexPath.item]
            self.deleteResume(resume: resume)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OfferTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resumes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ResumeTableViewCell
        //config
        let resume = self.resumes[indexPath.row]
        cell.config(resume: resume)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resume = self.resumes[indexPath.row]
        if finishSelectResume != nil {
            self.finishSelectResume!(resume.id)
            self.dismiss(animated: true, completion: nil)
        }else {
            let createResumeVC = EditResumeViewController(resume: resume)
            navigationController?.pushViewController(createResumeVC, animated: true)
        }
    }
}
