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
    
    /// 두 날짜 사이의 일 수를 계산 (Gregorian 기준)
    /// - Parameters:
    ///   - from: 시작 날짜
    ///   - to: 종료 날짜
    /// - Returns: 날짜 차이 (일 단위)
    static func daysBetween(from startDate: Date, to endDate: Date) -> Int? {
        let startOfDay = gregorian.startOfDay(for: startDate)
        let endOfDay = gregorian.startOfDay(for: endDate)
        let components = gregorian.dateComponents([.day], from: startOfDay, to: endOfDay)
        return components.day
    }
}
