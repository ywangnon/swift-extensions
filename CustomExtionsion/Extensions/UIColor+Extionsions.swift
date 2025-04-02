//
//  UIColorExtionsion.swift
//  CustomExtionsion
//
//  Created by Hansub Yoo on 2022/07/22.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: - Hex String 지원 (e.g. "#FF0000", "F00", "FF0000FF")
    public convenience init?(hex: String?) {
        guard var hex = hex?.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() else {
            return nil
        }
        
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        
        if hex.count == 3 || hex.count == 4 {
            hex = hex.map { "\($0)\($0)" }.joined()
        }
        
        var hexNumber: UInt64 = 0
        guard Scanner(string: hex).scanHexInt64(&hexNumber) else {
            return nil
        }
        
        let r, g, b, a: CGFloat
        
        switch hex.count {
        case 6:
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000FF) / 255
            a = 1
        case 8:
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        default:
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // MARK: - Hex Int 지원 (e.g. 0xFF0000)
    public convenience init(hex: Int) {
        let r = CGFloat((hex >> 16) & 0xFF) / 255
        let g = CGFloat((hex >> 8) & 0xFF) / 255
        let b = CGFloat(hex & 0xFF) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
    
    // MARK: - Int RGB (0~255) + alpha (0~1)
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255,
                  green: CGFloat(green) / 255,
                  blue: CGFloat(blue) / 255,
                  alpha: alpha)
    }
}

// 그룹핑
/*
enum ThemeColor {
    enum Button {
        static let text = UIColor(hex: 0x34711E)
        static let sub = UIColor(hex: 0x34711E)
    }

    enum Background {
        static let `default` = UIColor(hex: 0x9C9C9C)
        static let secondary = UIColor(hex: 0x9C9C9C)
    }

    static let primary = UIColor(named: "primary")
    static let secondary = UIColor(named: "secondary")
    static let tertiary = UIColor(named: "tertiary")
}
*/
