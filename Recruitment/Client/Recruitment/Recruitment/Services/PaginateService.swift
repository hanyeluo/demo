//
//  PaginateService.swift
//  Caelum-iPhone
//
//  Created by luo on 2016/12/7.
//  Copyright © 2016年 . All rights reserved.
//
import UIKit

class PaginateService<T: BaseModel> {
    
    var currPage = 1
    var isMore = true
    var isLoading = false
    
    
    func refresh(_ url: String, paramters:Dictionary<String,String>? = nil, complete:@escaping ( _ items: [T], _ error: ResponseError?)->(Void))  {
        if isLoading == true {
            return
        }
        
        currPage = 1
        isMore = true
        
        //加载数据
        self.loadData(url, paramters: paramters) { (items, error) -> (Void) in
            complete(items, error)
        }
    }
    
    func loadMore(_ url: String, paramters:Dictionary<String,String>? = nil, complete:@escaping ( _ items: [T], _ error: ResponseError?)->(Void))  {
        if isLoading == true {
            return
        }
        if isMore == false {
            complete([T](), .noContent)
            return
        }
        
        currPage += 1
        
        //加载数据
        self.loadData(url, paramters: paramters) { (items, error) -> (Void) in
            complete(items, error)
        }
    }
    
    
    fileprivate func loadData(_ url: String, paramters:Dictionary<String,String>? = nil, complete:@escaping ( _ items: [T], _ error: ResponseError?)->(Void)) {
        //设置正在加载
        isLoading = true
        //设置参数
        var params = [String: String]()
        if paramters != nil {
            params = paramters!
        }
        params["page"] = String(currPage)
        
        //加载数据
        CollectionService<T>.get(url, paramters: params) { (items, error) -> (Void) in
            //更新状态
            self.isLoading = false
            
            //判断是否还有数据
            if error != nil || items.count == 0 {
                self.isMore = false
            }
            
            complete(items, error)
            
        }
    }
}
