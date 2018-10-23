//
//  UIColor.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int , green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0 , alpha: 1.0)
    }
    
    //Paste HEX value after 0x
    //54565F
    static var myGrayColor: UIColor { return UIColor.init(rgb: 0x54565F)}
    //0A0A0A)
    static var customBG: UIColor { return UIColor.init(rgb: 0x0A0A0A)}
    //1a1a1a
    static var customBG2: UIColor { return UIColor.init(rgb: 0x1a1a1a)}
     //8c7c6e
    static var customBarTint: UIColor { return UIColor.init(rgb: 0x8c7c6e)}
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue : rgb & 0xFF
        )
}

}
