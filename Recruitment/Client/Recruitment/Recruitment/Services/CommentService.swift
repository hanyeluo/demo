//
//  CommentService.swift
//  Recruitment
//
//  Created by luo on 2017/2/12.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class CommentService {
    func post(offer: Offer, comment: Comment, complete: @escaping (  _ error: ResponseError?)-> (Void))  {
        let params = ["content": comment.content]
        NetWorkService.shared.request(.post, url: "\(BASE_URL)/api/offers/\(offer.id)/comments", paramters: params) { (response, error) -> (Void) in
            logInfo(error)
            logInfo(response)
            
            complete(error)
        }
    }
}
