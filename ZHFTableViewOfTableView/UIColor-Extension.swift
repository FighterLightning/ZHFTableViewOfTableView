//
//  UIColor-Extension.swift
//  
//
//  Created by 张海峰 on 2017/8/14.
//
//

import Foundation
import UIKit
extension UIColor
{
        class func initcolorWithAlpha(value: IntegerLiteralType) -> UIColor {
            let red = CGFloat((value & 0xFF0000) >> 16) / 255.0
            let green = CGFloat((value & 0x00FF00) >> 8) / 255.0
            let blue = CGFloat(value & 0x0000FF) / 255.0
            let alpha = CGFloat(1.0)
            return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
        }
}
