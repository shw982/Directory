//
//  String+Extension.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import Foundation

extension String {
  
    func getFormattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        
        guard let formattedDate = formatter.date(from: self) else { return "" }
        formatter.dateFormat = "dd MMM, yyyy"
        
        return formatter.string(from: formattedDate)
    }
}
