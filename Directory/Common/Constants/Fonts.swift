//
//  Fonts.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation
import UIKit

struct Fonts {
    
    enum Name: String {
        case openSans = "OpenSans"
        case openSansSemibold = "OpenSans-Semibold"
        case openSansItalic = "OpenSans-Italic"
        case futura = "Futura"
    }
    
    static func font(_ name: Name, size: CGFloat) -> UIFont {
        UIFont(name: name.rawValue, size: size)!
    }
    
    static func appFont(withSize size: CGFloat) -> UIFont {
        let fontSize = UIDevice.iPad ? size + 2 : size
        return font(.openSans, size: fontSize)
    }
    
    static func appBoldFont(withSize size: CGFloat) -> UIFont {
        let fontSize = UIDevice.iPad ? size + 2 : size
        return font(.openSansSemibold, size: fontSize)
    }
    
    static func appItalicFont(withSize size: CGFloat) -> UIFont {
        let fontSize = UIDevice.iPad ? size + 2 : size
        return font(.openSansItalic, size: fontSize)
    }
    
    /// Header
    static let largeHeader          = Fonts.appBoldFont(withSize: 28)
    static let boldHeader           = Fonts.appBoldFont(withSize: 18)
    static let header               = Fonts.appFont(withSize: 18)
        
    /// Title
    static let largeTitle           = Fonts.appFont(withSize: 30)
    static let boldTitle            = Fonts.appBoldFont(withSize: 16)
    static let title                = Fonts.appFont(withSize: 16)
    
    /// SubTitle
    static let largeSubtitle        = Fonts.appFont(withSize: 20)
    static let boldSubtitle         = Fonts.appBoldFont(withSize: 15)
    static let subtitle             = Fonts.appFont(withSize: 15)
    static let italicSubtitle       = Fonts.appItalicFont(withSize: 15)
    
    /// Body
    static let boldBody             = Fonts.appBoldFont(withSize: 14)
    static let body                 = Fonts.appFont(withSize: 14)
    static let italicBody           = Fonts.appItalicFont(withSize: 14)
    
    /// Footer
    static let boldFooter           = Fonts.appBoldFont(withSize: 13)
    static let footer               = Fonts.appFont(withSize: 13)
    static let italicFooter         = Fonts.appItalicFont(withSize: 13)
    
    /// Small
    static let small                = Fonts.appFont(withSize: 10)
    static let extraSmall           = Fonts.appFont(withSize: 9.5)
    
}
