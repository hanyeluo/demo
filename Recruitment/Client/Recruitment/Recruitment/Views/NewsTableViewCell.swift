//
//  NewsTableViewCell.swift
//  Recruitment
//
//  Created by luo on 2017/2/11.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
let NewsTableViewCellHeight: CGFloat = 72.0
class NewsTableViewCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let _nameLabel = UILabel(frame: CGRect(x: 20, y: 12, width: 300, height: 16))
        _nameLabel.font = UIFont.systemFont(ofSize: T1)
        _nameLabel.textColor = .darkGray
        return _nameLabel
    }()
    
    lazy var descLabel: UILabel = {
        let _descLabel = UILabel(frame: CGRect(x: 20, y: self.nameLabel.frame.maxY + 10, width: 300, height: 16))
        _descLabel.font = UIFont.systemFont(ofSize: T1)
        _descLabel.textColor = .darkGray
        return _descLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(descLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func config(news: News)  {
        nameLabel.text = news.title
        descLabel.text = news.desc
    }

}
