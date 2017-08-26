//
//  ResumeTableViewCell.swift
//  Recruitment
//
//  Created by luo on 2017/2/13.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
let ResumeTableViewCellHeight: CGFloat = 72
class ResumeTableViewCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let _titleLabel = UILabel(frame: CGRect(x: 20, y: 12, width: 300, height: 16))
        _titleLabel.font = UIFont.systemFont(ofSize: T1)
        _titleLabel.textColor = .darkGray
        return _titleLabel
    }()
    
    lazy var descLabel: UILabel = {
        let _descLabel = UILabel(frame: CGRect(x: 20, y: self.titleLabel.frame.maxY + 10, width: 300, height: 16))
        _descLabel.font = UIFont.systemFont(ofSize: T1)
        _descLabel.textColor = .darkGray
        return _descLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(descLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func config(resume: Resume)  {
        titleLabel.text = resume.title
        descLabel.text = resume.desc
    }

}
