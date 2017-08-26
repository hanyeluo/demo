//
//  ConfigureHelper.swift
//  Recruitment
//
//  Created by luo on 2017/2/6.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height




let BASE_URL = "http://recruitment.dev"
let SUPPORT_URL = "http://support.recruitment.dev"
let ACCEPT_V1 = "application/json"
let CLIENT_ID = "1"
let CLIENT_SECRET = "UPCu0kxaiH07pgmxYRI1woZuZCxCmsY62yJJD0wx"

public func logInfo(_ message: Any?, file: String = #file, function: String = #function, line: Int = #line ) {
    print("\(message ?? "nil") => \(function) \(file):\(line)")
}


