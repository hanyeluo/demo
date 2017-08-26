
//
//  ItemService.swift
//  Caelum-iPhone
//
//  Created by luo on 2016/12/7.
//  Copyright © 2016年 . All rights reserved.
//
import UIKit

class ModelService<T: BaseModel> {
    
    class func get(_ url: String, paramters:Dictionary<String,String>? = nil, complete:@escaping ( _ item: T?, _ error: ResponseError?)->(Void)) {
        //网络请求
        NetWorkService.shared.request(.get, url: url, paramters: paramters) { (rootDic, error) -> (Void) in
            var model:T? = nil
            var responseError: ResponseError? = error
            
            if error == nil {
                //判断是否数据为空
                if rootDic != nil {
                    if let dataDic = rootDic!["data"] as? NSDictionary {
                        model = T(dic: dataDic)
                        
                    }else {
                        responseError = .brokenData
                    }
                }else {
                    responseError = .noContent
                }
            }
            
            complete(model, responseError)
        }
    }
}
