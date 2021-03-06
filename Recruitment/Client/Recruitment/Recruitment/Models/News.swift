//
//  News.swift
//  Recruitment
//
//  Created by luo on 2017/2/11.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class News: BaseModel {
    var id = 0
    var title = ""
    var desc = ""
    var content = ""
    var user: User?
    
    required init(dic: NSDictionary) {
        if let value = dic["id"] as? Int{
            id = value
        }
        if let value = dic["title"] as? String{
            title = value
        }
        if let value = dic["desc"] as? String{
            desc = value
        }
        if let value = dic["content"] as? String{
            content = value
        }
        if let value = dic["user"] as? NSDictionary{
            user = User(dic: value)
        }
        
    }
}
