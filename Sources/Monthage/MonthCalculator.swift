import Foundation

/// Calculates month progress percentage and related metrics
struct MonthCalculator {
    private let calendar: Calendar
    private let currentDate: Date
    
    init(calendar: Calendar = .current, currentDate: Date = Date()) {
        self.calendar = calendar
        self.currentDate = currentDate
    }
    
    /// Returns the percentage of the current month that has elapsed (0-100)
    func calculatePercentage() -> Int {
        guard let startOfMonth = calendar.date(
            from: calendar.dateComponents([.year, .month], from: currentDate)
        ),
        let startOfNextMonth = calendar.date(
            byAdding: .month,
            value: 1,
            to: startOfMonth
        ) else {
            return 0
        }
        
        let totalSeconds = startOfNextMonth.timeIntervalSince(startOfMonth)
        let elapsedSeconds = currentDate.timeIntervalSince(startOfMonth)
        
        guard totalSeconds > 0 else { return 0 }
        return Int((elapsedSeconds / totalSeconds) * 100)
    }
    
    /// Returns the number of days remaining in the current month
    func daysRemaining() -> Int {
        guard let startOfMonth = calendar.date(
            from: calendar.dateComponents([.year, .month], from: currentDate)
        ),
        let startOfNextMonth = calendar.date(
            byAdding: .month,
            value: 1,
            to: startOfMonth
        ) else {
            return 0
        }
        
        return calendar.dateComponents([.day], from: currentDate, to: startOfNextMonth).day ?? 0
    }
    
    /// Returns the formatted current month name (e.g., "Enero 2026")
    func currentMonthName() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentDate).capitalized
    }
}
