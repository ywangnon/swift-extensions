# 유틸리티 확장 모음

iOS 프로젝트에서 자주 쓰이는 확장 유틸리티를 모아 정리했습니다.

---

## 🖍 UIColor Extensions

- `UIColor(hex: String?)`: `"#FF0000"` 또는 `"FF0000FF"` 같은 문자열로 색상 생성
- `UIColor(hex: Int)`: `0xRRGGBB` 포맷으로 색상 생성
- `UIColor(red:green:blue:alpha:)`: RGB 정수값으로 생성
- 그룹 컬러: `ThemeColor.Button.text`, `ThemeColor.Background.default` 등으로 관리

```swift
let color = UIColor(hex: "#FF5733")
```

---

## 📆 Date Extensions

- `Date.currentDateAndTimeForAnalysis()`: 분석용 포맷 반환
- `Date.formatted(using:)`: 날짜 포맷 간편 변환

```swift
let (date, time) = Date.currentDateAndTimeForAnalysis()
```

---

## 📅 Calendar Extensions

- Gregorian 기준 날짜 계산
- `Calendar.currentMonth`: 현재 월 (1~12)
- `Calendar.currentYear`: 현재 연도 (예: 2025)
- `Calendar.currentYearShort`: 연도 뒤 2자리 (예: 25)
- `Calendar.age(from:)`: 생년월일로부터 만 나이 계산
- `Calendar.daysBetween(from:to:)`: 두 날짜 사이의 일 수 계산

```swift
let age = Calendar.age(from: birthDate)
let diff = Calendar.daysBetween(from: startDate, to: endDate)
```

---

