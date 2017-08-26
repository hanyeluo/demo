//
//  OfferTableViewCell.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit
let OfferTableViewCellHeight: CGFloat = 72

class OfferTableViewCell: UITableViewCell {

    lazy var nameLabel: UILabel = {
        let _nameLabel = UILabel(frame: CGRect(x: 20, y: 12, width: 200, height: 16))
        _nameLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _nameLabel.textColor = .darkGray
        return _nameLabel
    }()
    
    lazy var descLabel: UILabel = {
        let _descLabel = UILabel(frame: CGRect(x: 20, y: self.nameLabel.frame.maxY + 10, width: 200, height: 16))
        _descLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _descLabel.textColor = .grayDark
        return _descLabel
    }()
    
    lazy var payLabel: UILabel = {
        let _payLabel = UILabel(frame: CGRect(x: SCREEN_WIDTH-120, y: 12, width: 100, height: 16))
        _payLabel.textAlignment = .right
        _payLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _payLabel.textColor = .red
        return _payLabel
    }()
    
    lazy var educationLabel: UILabel = {
        let _educationLabel = UILabel(frame: CGRect(x: SCREEN_WIDTH-120, y: self.nameLabel.frame.maxY + 10, width: 100, height: 16))
        _educationLabel.textAlignment = .right
        _educationLabel.font = UIFont.boldSystemFont(ofSize: T1)
        _educationLabel.textColor = .grayDark
        return _educationLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(nameLabel)
        addSubview(descLabel)
        addSubview(payLabel)
        addSubview(educationLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func config(offer: Offer)  {
        nameLabel.text = offer.title
        descLabel.text = offer.user?.company
        payLabel.text = offer.pay
        educationLabel.text = offer.education
        
    }
}
