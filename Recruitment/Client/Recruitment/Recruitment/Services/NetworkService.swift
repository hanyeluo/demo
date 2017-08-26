//
//  NetWorkService.swift
//  Caelum-iPhone
//
//  Created by luo on 2016/11/25.
//  Copyright © 2016年 . All rights reserved.
//
import UIKit
import Alamofire

enum ResponseSuccess: Int {
    case success = 1//请求成功(200)
    case created = 2 //创建成功(201)
    case accept = 3 //请求允许(202)
    case noContent = 4 //请求成功但是没有数据(成功级别)(204)
}

enum ResponseWarning: Int {
    case loading = 1 //正在加载
    case noMore = 2 //没有更多数据(警告级别)
}

enum ResponseError: Error {
    case noContent    //没有数据
    case brokenData //数据损坏
    case notFound  //错误，没有找到资源(错误级别)(404)
    case methodNotAllow //请求方法不允许
    case badRequest(messages: [String]) //用户请求失败，用户数据是有错误(400\422)
    case unAuth  //没有登录(401)
    case forbidden  //没有权限访问(403)
    case serverFailed  //服务器错误，服务器崩溃(500)
    case noInternet  //手机没有网络连接(手机硬件)
    case unKnow  //未知其他错误，编码错误
    
    var description: String {
        switch self {
        case .noContent:
            return "没有数据"
        case .brokenData:
            return "数据损坏"
        case .notFound:
            return "没有找到资源"
        case .methodNotAllow:
            return "请求方法不允许"
        case .badRequest( let messages):
            var messagesString = ""
            for message in messages {
                messagesString += message + ""
            }
            return messagesString
        case .unAuth:
            return "没有登录"
        case .forbidden:
            return "没有权限访问"
        case .serverFailed:
            return "服务器崩溃"
        case .noInternet:
            return "noInternet"
        case .unKnow:
            return "未知错误"
        }
    }
}


class NetWorkService {
    
    static let shared = NetWorkService()
    
    fileprivate init() {}
    
    
    func request(_ method: HTTPMethod, url: String, paramters:Dictionary<String,Any>? = nil, complete:@escaping ( _ data: NSDictionary?, _ error: ResponseError?)->(Void)) {
        
        var headers: HTTPHeaders = ["Accept": ACCEPT_V1]
        
        if let auth = Authenticate.local() {
            headers["Authorization"] = auth.tokenType + " " + auth.accessToken
        }
        
        Alamofire.request(url, method: method, parameters: paramters, headers: headers).responseJSON { (response) in
            
            
            logInfo(response)
            
            var error: ResponseError? = nil
            var responseData: NSDictionary? = nil
            
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                case 201:
                    
                    if let headers = response.response?.allHeaderFields as? [String: String] {
                        if let location = headers["Location"]  {
                            responseData = ["id": location]
                        }
                    }
                    
                case 200 ... 300:
                    //成功
                    if response.result.value != nil {
                        if let dic = response.result.value as? NSDictionary {
                            responseData = dic
                        }else {
                            //error = .brokenData
                        }
                    }
                    
                case 400:
                    //错误格式分解
                    if let dic = response.result.value as? NSDictionary {
                        
                        if let message = dic["error"] as? String {
                            error = .badRequest(messages: [message])
                        }else {
                            error = .badRequest(messages: ["未知错误(没有message信息)"])
                        }
                        
                    }else {
                        error = .badRequest(messages: ["未知错误(json格式错误)"])
                    }
                case 422:
                    if let dic = response.result.value as? NSDictionary {
                        
                        if let messageArray = dic["errors"] as? NSDictionary {
                            var errors = [String]()
                            for ( _, value) in messageArray {
                                if let errorItemArray = value as? NSArray {
                                    for errorItem in errorItemArray {
                                        errors.append(errorItem as! String)
                                    }
                                }else {
                                    error = .badRequest(messages: ["未知错误(error错误信息缺失)"])
                                }
                            }
                            error = .badRequest(messages: errors)
                            
                        }else {
                            error = .badRequest(messages: ["未知错误(没有message信息)"])
                        }
                        
                    }else {
                        error = .badRequest(messages: ["未知错误(json格式错误)"])
                    }
                case 401:
                    error = .unAuth
                case 403:
                    error = .forbidden
                case 404:
                    error = .notFound
                case 405:
                    error = .methodNotAllow
                case 500 ... 600:
                    error = .serverFailed
                default:
                    error = .unKnow
                    break
                }
            }else {
                error = .noInternet
            }
            
            if error != nil {
                logInfo(response)
            }
            
            complete(responseData, error)
            
            
        }
        
    }
    
}
