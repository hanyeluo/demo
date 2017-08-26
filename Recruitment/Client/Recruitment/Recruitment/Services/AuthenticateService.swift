//
//  AuthenticateService.swift
//  Sagitta-iPhone
//
//  Created by luo on 16/10/17.
//  Copyright © 2016年 . All rights reserved.
//
import UIKit
import Alamofire


class AuthenticateService: NSObject {
    
    class func login(_ username: String, password: String, complete:@escaping (_ error: Error?)->(Void)) {
        let headers: HTTPHeaders = ["Accept": ACCEPT_V1]
        let paramters = ["username": username, "password": password, "grant_type": "password", "client_id": CLIENT_ID, "client_secret": CLIENT_SECRET]
        
        Alamofire.request("\(BASE_URL)/oauth/token", method: .post, parameters: paramters, headers: headers).responseJSON { (response) in
            
            var error: ResponseError? = nil
            
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                case 200 ... 300:
                    //成功
                    if let rootDic = response.result.value as? NSDictionary {
                        let auth = Authenticate(dic: rootDic)
                        auth.saveToLocal()
                    }else {
                        error = .brokenData
                    }
                case 400:
                    error = .badRequest(messages: ["用户错误"])
                case 401:
                    error = .unAuth
                case 403:
                    error = .forbidden
                case 404:
                    error = .notFound
                case 500 ... 600:
                    error = .serverFailed
                default:
                    error = .unKnow
                    break
                }
            }else {
                error = .noInternet
            }
            
            complete(error)
        }
    }
}
