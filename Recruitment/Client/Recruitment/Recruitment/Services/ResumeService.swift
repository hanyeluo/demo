//
//  ResumeService.swift
//  Recruitment
//
//  Created by luo on 2017/2/12.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class ResumeService {
    func send(offerId: Int, resumeId: Int, complete: @escaping (_ error: ResponseError?)-> (Void))  {
        
        let url = "\(BASE_URL)/api/offers/\(offerId)/resumes/\(resumeId)"

        NetWorkService.shared.request(.post, url: url, paramters: nil){(data, error)->(Void) in
            complete(error)
        }
    }
    
    func delete(resume: Resume, complete: @escaping (_ error: ResponseError?)-> (Void)) {
        NetWorkService.shared.request(.delete, url: "\(BASE_URL)/api/resumes/\(resume.id)") { (response, error) -> (Void) in
            complete(error)
        }
    }
}
