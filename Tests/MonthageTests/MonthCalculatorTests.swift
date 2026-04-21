import XCTest
@testable import Monthage

final class MonthCalculatorTests: XCTestCase {
    
    func testCalculatePercentage_MidMonth() {
        // GIVEN: April 15, 2026 at 12:00
        var components = DateComponents(year: 2026, month: 4, day: 15, hour: 12)
        let date = Calendar.current.date(from: components)!
        let calculator = MonthCalculator(currentDate: date)
        
        // WHEN
        let percentage = calculator.calculatePercentage()
        
        // THEN: Should be around 47-48% (April has 30 days)
        XCTAssertEqual(percentage, 48, accuracy: 2)
    }
    
    func testCalculatePercentage_StartOfMonth() {
        // GIVEN: First day of month at 00:00
        var components = DateComponents(year: 2026, month: 3, day: 1, hour: 0, minute: 0)
        let date = Calendar.current.date(from: components)!
        let calculator = MonthCalculator(currentDate: date)
        
        // WHEN
        let percentage = calculator.calculatePercentage()
        
        // THEN: Should be 0%
        XCTAssertEqual(percentage, 0)
    }
    
    func testCalculatePercentage_EndOfMonth() {
        // GIVEN: Last day of April at 23:59
        var components = DateComponents(year: 2026, month: 4, day: 30, hour: 23, minute: 59)
        let date = Calendar.current.date(from: components)!
        let calculator = MonthCalculator(currentDate: date)
        
        // WHEN
        let percentage = calculator.calculatePercentage()
        
        // THEN: Should be around 99-100%
        XCTAssertEqual(percentage, 99, accuracy: 2)
    }
    
    func testCalculatePercentage_LeapYearFebruary() {
        // GIVEN: February 29, 2024 (leap year) at 23:59
        var components = DateComponents(year: 2024, month: 2, day: 29, hour: 23, minute: 59)
        let date = Calendar.current.date(from: components)!
        let calculator = MonthCalculator(currentDate: date)
        
        // WHEN
        let percentage = calculator.calculatePercentage()
        
        // THEN: Should be around 99-100%
        XCTAssertEqual(percentage, 99, accuracy: 2)
    }
    
    func testDaysRemaining_MidMonth() {
        // GIVEN: April 15, 2026
        var components = DateComponents(year: 2026, month: 4, day: 15)
        let date = Calendar.current.date(from: components)!
        let calculator = MonthCalculator(currentDate: date)
        
        // WHEN
        let days = calculator.daysRemaining()
        
        // THEN: April has 30 days, days 15-30 inclusive = 16 days remaining
        XCTAssertEqual(days, 16)
    }
    
    func testCurrentMonthName() {
        // GIVEN: January 15, 2026
        var components = DateComponents(year: 2026, month: 1, day: 15)
        let date = Calendar.current.date(from: components)!
        let calculator = MonthCalculator(currentDate: date)
        
        // WHEN
        let monthName = calculator.currentMonthName()
        
        // THEN: Should contain "Enero" and "2026"
        XCTAssertTrue(monthName.contains("Enero"))
        XCTAssertTrue(monthName.contains("2026"))
    }
}