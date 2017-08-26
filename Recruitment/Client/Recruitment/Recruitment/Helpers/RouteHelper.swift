//
//  RouteHelper.swift
//  Recruitment
//
//  Created by luo on 2017/2/12.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class RouteHelper: NSObject {
    class func presentLoginVC (viewController: UIViewController, completion: (() -> Void)? ) {
        let loginVC = LoginViewController()
        let navigation = UINavigationController(rootViewController: loginVC)
        navigation.isNavigationBarHidden = true
        viewController.present(navigation, animated: true, completion: completion)
    }
    
    
    
}
