import UIKit

class CollectionService<T: BaseModel> {
    
    class func get(_ url: String, paramters:Dictionary<String,String>? = nil, complete:@escaping ( _ items: [T], _ error: ResponseError?)->(Void)) {
        //网络请求
        NetWorkService.shared.request(.get, url: url, paramters: paramters) { (rootDic, error) -> (Void) in
            var models = [T]()
            var responseError: ResponseError? = error
            
            if error == nil {
                //判断是否数据为空
                
                if rootDic != nil {
                    
                    if let dataArray = rootDic!["data"] as? NSArray {
                        
                        //判断数据是否为空
                        if dataArray.count == 0 {
                            
                            responseError = .noContent
                            
                        }else {
                            for dataItem in dataArray {
                                if let dataDic = dataItem as? NSDictionary {
                                    let model = T(dic: dataDic)
                                    models.append(model)
                                }else {
                                    //元素数据损坏
                                    responseError = .brokenData
                                }
                            }
                        }
                        
                    }else {
                        //data数据元素损坏
                        responseError = .brokenData
                    }
                    
                }else {
                    //返回数据为空
                    responseError = .brokenData
                }
            }
            
            
            complete(models, responseError)
        }
    }
}
