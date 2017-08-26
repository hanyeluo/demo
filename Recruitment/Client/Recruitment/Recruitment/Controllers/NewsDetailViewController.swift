//
//  NewsDetailViewController.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {

    var news: News
    
    lazy var textView: UITextView = {
        let _textView = UITextView(frame: CGRect(x: 0, y: 76, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-76 ))
        _textView.textAlignment = .left
        _textView.textContainerInset = UIEdgeInsetsMake(0, 20, 0, 20)

        return _textView
    }()
    
    
    init(news: News) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
        title = news.title
        automaticallyAdjustsScrollViewInsets = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(textView)
        textView.text = news.content
    }
    
    
    


}
