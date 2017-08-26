//
//  WebViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/23.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    
    lazy var webView: UIWebView = {
        let _webView = UIWebView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64))
        return _webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView)
        automaticallyAdjustsScrollViewInsets = false
    }

    func loadUrl(urlString: String)  {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

}
