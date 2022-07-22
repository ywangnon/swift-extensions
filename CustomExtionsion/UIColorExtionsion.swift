//
//  UIColorExtionsion.swift
//  CustomExtionsion
//
//  Created by Hansub Yoo on 2022/07/22.
//

import Foundation
import UIKit

extension UIColor {
    /// 255로 나누지 않은 정수값으로 rgb값 구하는 함수
    /// - Parameters: 각 RGB의 분자값
    ///   - alpha: 투명도 0~1
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        self.init(red: CGFloat(red)/CGFloat(255), green: CGFloat(green)/CGFloat(255), blue: CGFloat(blue)/CGFloat(255), alpha: CGFloat(alpha))
    }
    
    /// 각 rgb의 헥스값을 받아서 UIColor를 구하는 함수
    /// 입력시 0xff식으로 16진수표기 방식으로 넣는다.
    ///
    /// - Parameters:
    ///   - hexRed: 16진수 red값. 전체 헥스값의 앞 2자리
    ///   - hexGreen: 16진수 green값. 전체 헥스값의 중간 2자리
    ///   - hexBlue: 16진수 blue값. 전체 헥스값의 뒤 2자리
    convenience init(hexRed: Int, hexGreen: Int, hexBlue: Int) {
        assert(hexRed >= 0 && hexRed <= 255, "Invalid red component")
        assert(hexGreen >= 0 && hexGreen <= 255, "Invalid green component")
        assert(hexBlue >= 0 && hexBlue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(hexRed) / 255.0, green: CGFloat(hexRed) / 255.0, blue: CGFloat(hexRed) / 255.0, alpha: 1.0)
    }
    
    /// 헥스값을 통한 UIColor 구하는 함수
    /// 0xffffff식으로 16진수 표기 방식으로 넣는다.
    ///
    /// - Parameter hex: 16진수 헥스값
    convenience init(hex: Int) {
        self.init(hexRed: hex >> 16 & 0xff,
                  hexGreen: hex >> 8 & 0xff,
                  hexBlue: hex & 0xff)
    }
    
    // 컨셉색을 중심으로 asset에서 정해서 넣는 방식
    class var primary: UIColor? { return UIColor(named: "primary") }
    class var secondary: UIColor? { return UIColor(named: "secondary") }
    class var tertiary: UIColor? { return UIColor(named: "tertiary") }
    
    // 객체를 중심으로 asset에서 정해서 넣는 방식
    enum Button {
        static let text: UIColor = { UIColor(hex: 0x34711eb) }()
        static let sub: UIColor = { UIColor(hex: 0x34711eb) }()
    }
    
    enum Background {
        // 예약어를 변수로 넣으려면 backtick 삽입
        static let `default` = { UIColor(hex: 0x9c9c9c) }()
        static let secondary = { UIColor(hex: 0x9c9c9c) }()
    }
}
