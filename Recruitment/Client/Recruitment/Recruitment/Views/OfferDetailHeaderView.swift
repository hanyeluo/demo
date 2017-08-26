//
//  OfferDetailHeaderView.swift
//  Recruitment
//
//  Created by luo on 2017/2/11.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class OfferDetailHeaderView: UIView {

    
    lazy var lineLabel: UILabel = {
        let _lineLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 5, height: 20))
        _lineLabel.backgroundColor = .blue
        return _lineLabel
    }()
    
    lazy var titleLabel: UILabel = {
        let _titleLabel = UILabel(frame: CGRect(x: self.lineLabel.frame.maxX+6, y: self.lineLabel.frame.minY, width: 300, height: 20))
        _titleLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _titleLabel.textColor = .blue
        _titleLabel.text = "职位详细信息"
        return _titleLabel
    }()
    
    lazy var detailLabel: UILabel = {
        let _detailLabel = UILabel(frame: CGRect(x: 20, y: self.titleLabel.frame.maxY+20, width: SCREEN_WIDTH-40, height: 0))
        _detailLabel.font = UIFont.systemFont(ofSize: T1)
        _detailLabel.numberOfLines = 0
        _detailLabel.textColor = .darkGray
        return _detailLabel
    }()
    
    lazy var bottomLineLabel: UILabel = {
        let _lineLabel = UILabel(frame: CGRect(x: 20, y: self.detailLabel.frame.maxY+20, width: 5, height: 20))
        _lineLabel.backgroundColor = .blue
        return _lineLabel
    }()
    
    lazy var bottomTitleLabel: UILabel = {
        let _titleLabel = UILabel(frame: CGRect(x: self.bottomLineLabel.frame.maxX+6, y: self.bottomLineLabel.frame.minY, width: 300, height: 20))
        _titleLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _titleLabel.textColor = .blue
        _titleLabel.text = "用户评论信息"
        return _titleLabel
    }()
    
    
    init(frame: CGRect, offer: Offer) {
        super.init(frame: frame)
        
        addSubview(lineLabel)
        addSubview(titleLabel)
        addSubview(detailLabel)
        
        
        let height = offer.detail.heightWithConstrainedWidth(width: self.detailLabel.frame.size.width, font: self.detailLabel.font)
        detailLabel.frame.size.height = height
        detailLabel.text = offer.detail
        addSubview(bottomLineLabel)
        addSubview(bottomTitleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
