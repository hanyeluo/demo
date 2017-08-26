//
//  Resume.swift
//  Recruitment
//
//  Created by luo on 2017/2/13.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class Resume: BaseModel {
    var id = 0
    var title = ""
    var desc = ""
    var detail = ""
    var name = ""
    var sex = 0
    var school = ""
    var user: User?
    
    required init(dic: NSDictionary) {
        if let value = dic["id"] as? Int{
            id = value
        }
        if let value = dic["sex"] as? Int{
            sex = value
        }
        if let value = dic["title"] as? String{
            title = value
        }
        if let value = dic["desc"] as? String{
            desc = value
        }
        if let value = dic["school"] as? String{
            school = value
        }
        if let value = dic["name"] as? String{
            name = value
        }
        if let value = dic["detail"] as? String{
            detail = value
        }
        if let value = dic["user"] as? NSDictionary{
            user = User(dic: value)
        }
    }
}
