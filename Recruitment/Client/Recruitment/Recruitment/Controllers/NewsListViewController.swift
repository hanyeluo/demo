//
//  NewsListViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var user: User
    var newsList = [News]()
    lazy var refreshController: UIRefreshControl = {
        let _refreshController = UIRefreshControl()
        _refreshController.addTarget(self, action: #selector(JobOfferListViewController.fetchData), for: .valueChanged)
        return _refreshController
    }()
    
    lazy var tableView: UITableView = {
        let _tableView = UITableView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-64))
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.refreshControl = self.refreshController
        _tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        title = user.company
        automaticallyAdjustsScrollViewInsets = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        fetchData()
    }

    //network
    func fetchData()  {
        CollectionService<News>.get("\(BASE_URL)/api/users/\(user.id)/news") { (newsList, error) -> (Void) in
            if error != nil {
                
            }else {
                self.newsList = newsList
                self.tableView.reloadData()
                self.refreshController.endRefreshing()
            }
        }
    }
    
    //table delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NewsTableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        //config
        let news = newsList[indexPath.row]
        cell.config(news: news)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = newsList[indexPath.row]
        let url = "\(SUPPORT_URL)/newses/\(news.id)"
        let webView = WebViewController()
        webView.loadUrl(urlString: url)
        navigationController?.pushViewController(webView, animated: true)
        
    }


}
