//
//  UIDevice+Extension.swift
//  Directory
//
//  Created by Sweta Jaiswal on 07/03/24.
//

import Foundation
import SwiftUI

extension UIDevice {
    
    static var iPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var iPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
