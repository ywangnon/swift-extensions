//
//  Calendar+Extensions.swift
//  CustomExtionsion
//
//  Created by Hansub Yoo on 4/2/25.
//

import Foundation

extension Calendar {

    /// Gregorian Calendar를 기준으로 날짜 계산
    static let gregorian = Calendar(identifier: .gregorian)

    /// 현재 월 (Gregorian 기준)
    static var currentMonth: Int {
        gregorian.component(.month, from: Date())
    }

    /// 현재 연도 (Gregorian 기준)
    static var currentYear: Int {
        gregorian.component(.year, from: Date())
    }

    /// 현재 연도의 마지막 두 자리 (예: 2024 → 24)
    static var currentYearShort: Int {
        currentYear - 2000
    }

    /// 생년월일로부터 만 나이 계산 (Gregorian 기준)
    /// - Parameter birth: 생년월일 `Date`
    /// - Returns: 현재 기준 만 나이
    static func age(from birth: Date) -> Int? {
        let now = Date()
        let components = gregorian.dateComponents([.year], from: birth, to: now)
        return components.year
    }
}
