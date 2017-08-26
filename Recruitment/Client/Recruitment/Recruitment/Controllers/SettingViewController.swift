//
//  SettingViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/24.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //UI
    lazy var tableView: UITableView = {
        let _tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return _tableView
    }()
    //MARK: - Life
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "设置"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    
    //table delegate

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //config
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "软件版本v1.0.0"
        case 1:
            cell.textLabel?.text = "退出登录"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            logInfo("点击了软件版本")
        case 1:
            Authenticate.logout()
            RouteHelper.presentLoginVC(viewController: self, completion: nil)
        default:
            break
        }
        
    }



}
