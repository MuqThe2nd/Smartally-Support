//
//  Extensions.swift
//  Smartally Support
//
//  Created by Muqtadir Ahmed on 20/05/17.
//  Copyright © 2017 Bitjini. All rights reserved.
//

import UIKit

public extension UIView {
    
    func radius(to: CGFloat) {
        self.layer.cornerRadius = to
    }
    
    func border(color: UIColor) {
        self.layer.borderColor = color.cgColor
    }
    
}

public extension String {
    
    func ISOToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone(identifier: "GMT")
        return formatter.date(from: self)
    }
    
    func to2DecimalPlaces() -> String {
        let occurrence = self.characters.filter({ $0 == "." }).count // If string has more than one '.' return 0.00
        if occurrence > 1 { return "" }
        
        if !self.contains(".") { // If decimal wasn't added, add here.
            return self + ".00"
        }
        
        // If decimal is present, then check how many zeroes are there after the '.'
        var numOfZeroes: Int {
            let range: Range<String.Index> = self.range(of: ".")!
            return self.distance(from: range.upperBound, to: self.endIndex)
        }
        
        if numOfZeroes == 0 {
            return self + "00"
        }
            
        else if numOfZeroes == 1 {
            return self + "0"
        }
        
        return self
    }
}

public extension Date {
    
    func mediumStyle() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
    
    func toISO() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}
