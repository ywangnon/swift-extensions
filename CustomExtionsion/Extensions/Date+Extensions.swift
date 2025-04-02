//
//  Date+Extensions.swift
//  CustomExtionsion
//
//  Created by Hansub Yoo on 4/2/25.
//

import UIKit

extension Date {
    
    // MARK: - Formatter Factory
    
    /// 공통적으로 사용하는 DateFormatter를 생성
    /// - Parameters:
    ///   - dateStyle: `.full`, `.short`, `.none` 등 스타일 기반 포맷
    ///   - timeStyle: 시간 포맷 스타일
    ///   - format: 직접 지정하는 dateFormat 문자열 (e.g. "yyyy-MM-dd")
    /// - Returns: 설정된 DateFormatter 인스턴스
    private static func makeFormatter(
        dateStyle: DateFormatter.Style = .none,
        timeStyle: DateFormatter.Style = .none,
        format: String? = nil
    ) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        
        if let format = format {
            formatter.dateFormat = format
        } else {
            formatter.dateStyle = dateStyle
            formatter.timeStyle = timeStyle
        }
        return formatter
    }
    
    // MARK: - Static Formatters
    
    static let ddMMyyyyFormatter = makeFormatter(format: "ddMMyyyy")
    static let HHmmssFormatter = makeFormatter(format: "HHmmss")
    static let yyyyMMddFormatter = makeFormatter(format: "yyyy-MM-dd")
    static let yyyyFormatter = makeFormatter(format: "yyyy")
    static let fullDateFormatter = makeFormatter(dateStyle: .full)
    
    // MARK: - Convenience Methods
    
    /// 현재 날짜 및 시간을 문자열로 반환 (포맷: "ddMMyyyy", "HHmmss")
    static func currentDateAndTimeForAnalysis() -> (date: String, time: String) {
        let now = Date()
        return (
            date: ddMMyyyyFormatter.string(from: now),
            time: HHmmssFormatter.string(from: now)
        )
    }
    
    /// 특정 formatter로 날짜 문자열 반환
    func formatted(using formatter: DateFormatter) -> String {
        formatter.string(from: self)
    }
}
