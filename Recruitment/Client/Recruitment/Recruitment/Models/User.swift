//
//  User.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class User: NSObject {
    var id = 0
    var email = ""
    var company = ""
    var password = ""
    
    init(dic: NSDictionary) {
        if let value = dic["id"] as? Int{
            id = value
        }
        if let value = dic["email"] as? String{
            email = value
        }
        if let value = dic["company"] as? String{
            company = value
        }
        
    }
    
    func toDic() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        if id != 0 {
            dictionary["id"] = id
        }
        
        dictionary["email"] = email
        dictionary["company"] = company
        
        return dictionary
    }
    
    func saveToLocal() {
        UserDefaults.standard.set(toDic(), forKey: "user")
        UserDefaults.standard.synchronize()
    }
    
    static func local() -> User? {
        if let userDic = UserDefaults.standard.value(forKey: "user") as? NSDictionary{
            return User(dic: userDic)
        }
        
        return nil
    }
}
