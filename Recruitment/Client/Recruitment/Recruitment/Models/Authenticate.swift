//
//  Authenticate.swift
//  Sagitta-iPhone
//
//  Created by luo on 16/10/17.
//  Copyright © 2016年 . All rights reserved.
//
import UIKit

class Authenticate: BaseModel {
    var tokenType = ""
    var expiresIn = 0
    var accessToken = ""
    var refreshToken = ""
    
    required init(dic: NSDictionary) {
        if let value = dic["token_type"] as? String{
            tokenType = value
        }
        if let value = dic["expires_in"] as? Int{
            expiresIn = value
        }
        if let value = dic["access_token"] as? String{
            accessToken = value
        }
        if let value = dic["refresh_token"] as? String{
            refreshToken = value
        }
    }
    
    static func local() -> Authenticate? {
        if let authDic = UserDefaults.standard.value(forKey: "Authenticate") as? NSDictionary{
            return Authenticate(dic: authDic)
        }
        
        return nil
    }
    
    func toDic() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary["token_type"] = tokenType
        dictionary["expires_in"] = String(expiresIn)
        dictionary["access_token"] = accessToken
        dictionary["refresh_token"] = refreshToken
        return dictionary
    }
    
    func saveToLocal()  {
        UserDefaults.standard.set(toDic(), forKey: "Authenticate")
        UserDefaults.standard.synchronize()
    }
    
    class func logout() {
        UserDefaults.standard.removeObject(forKey: "Authenticate")
        UserDefaults.standard.synchronize()
    }
    
    
    
    
}
