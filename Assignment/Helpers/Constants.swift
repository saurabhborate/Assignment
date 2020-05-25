//
//  Constants.swift
//  intellicar
//
//  Created by Ketan on 28/01/20.
//  Copyright © 2020 Ketan Doiphode. All rights reserved.
//

import Foundation
import UIKit
class genericConstants {
  static  let feedsData = "feed"
  static  let profileData = "userprofile"
}


struct networkConstants {
    static let baseUrl = "http://skunkworks.ignitesol.com:8000/books​"
    
}
extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
extension UIColor{
    static let RoyalBlueColor = UIColor.init(hexString: "5E56E7")
    static let TitanWhiteColor = UIColor.init(hexString: "F8F7FF")
    static let AthensGrayColor = UIColor.init(hexString: "F0F0F6")
    static let SilverChaliceColor = UIColor.init(hexString: "A0A0A0")
    static let MineShaftColor = UIColor.init(hexString: "333333")
}
