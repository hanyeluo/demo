//
//  Offer.swift
//  Recruitment
//
//  Created by luo on 2017/2/11.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class Offer: BaseModel {
    var id = 0
    var title = ""
    var pay = ""
    var detail = ""
    var education = ""
    var user: User?
    
    required init(dic: NSDictionary) {
        if let value = dic["id"] as? Int{
            id = value
        }
        if let value = dic["title"] as? String{
            title = value
        }
        if let value = dic["pay"] as? String{
            pay = value
        }
        if let value = dic["education"] as? String{
            education = value
        }
        if let value = dic["detail"] as? String{
            detail = value
        }
        if let value = dic["user"] as? NSDictionary{
            user = User(dic: value)
        }
    }
    
}
