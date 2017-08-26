//
//  UserService.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class UserService: NSObject {
    func regist(email: String, password: String, complete: @escaping (_ error: ResponseError?)-> (Void)) -> Void {
        
        let params = ["email":email,"password":password]
        
        NetWorkService.shared.request(.post, url: "\(BASE_URL)/api/users", paramters: params) { (response, error) -> (Void) in
            complete(error)
        }
        
    }
}
