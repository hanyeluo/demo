//
//  HudHelper.swift
//  Bootes-iPhone
//
//  Created by luo on 2017/3/14.
//  Copyright © 2017年 . All rights reserved.
//

import UIKit
import MBProgressHUD
class HudHelper {

    class func loading(hud: MBProgressHUD) {
        hud.mode = .indeterminate
        hud.label.text = "正在加载"
        hud.show(animated: true)
    }
    
    class func show(hud: MBProgressHUD,text: String?) {
        hud.mode = .text
        hud.label.text = text
        hud.show(animated: true)
        hud.hide(animated: true, afterDelay: 2)
    }
    class func hide(hud: MBProgressHUD) {
        hud.hide(animated: true)
    }
}
