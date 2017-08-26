//
//  ColorHelper.swift
//  Recruitment
//
//  Created by luo on 2017/2/11.
//  Copyright © 2017年 luo. All rights reserved.
//

import UIKit

class ColorHelper {
    
}

extension UIColor {
    convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            self.init(red:0.0, green: 0, blue: 0, alpha: 1)
        }else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            self.init(red:CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green:CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue:CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
        }
        
    }
    
    open class var grayLight: UIColor {
        return UIColor(hex: "#f7f7f7")
    }
    open class var gray: UIColor {
        return UIColor(hex: "#e1e1e1")
    }
    open class var grayDark: UIColor {
        return UIColor(hex: "#bdbdbd")
    }
    open class var darkGrayLight: UIColor {
        return UIColor(hex: "#9b9c9d")
    }
    open class var darkGray: UIColor {
        return UIColor(hex: "#494A4E")
    }
    open class var darkGrayDark: UIColor {
        return UIColor(hex: "#3c3c3d")
    }
    open class var blueLight: UIColor {
        return UIColor(hex: "#689df6")
    }
    open class var blue: UIColor {
        return UIColor(hex: "#4285f4")
    }
    open class var blueDark: UIColor {
        return UIColor(hex: "#4252F4")
    }
    open class var redLight: UIColor {
        return UIColor(hex: "#ee695d")
    }
    open class var red: UIColor {
        return UIColor(hex: "#ea4335")
    }
    open class var redDark: UIColor {
        return UIColor(hex: "#D0011B")
    }
    open class var yellowLight: UIColor {
        return UIColor(hex: "#fcc937")
    }
    open class var yellow: UIColor {
        return UIColor(hex: "#fbbc05")
    }
    open class var yellowDark: UIColor {
        return UIColor(hex: "#D49E00")
    }
    open class var greenLight: UIColor {
        return UIColor(hex: "#5db975")
    }
    open class var green: UIColor {
        return UIColor(hex: "#34a853")
    }
    open class var greenDark: UIColor {
        return UIColor(hex: "#1D913C")
    }
}



