import SwiftUI

@main
struct MonthageApp: App {
    var body: some Scene {
        MenuBarExtra {
            MenuContent()
        } label: {
            Text("📅 \(MonthCalculator().calculatePercentage())%")
                .font(.system(.body, design: .monospaced))
        }
        .menuBarExtraStyle(.menu)
    }
}

struct MenuContent: View {
    private let calculator = MonthCalculator()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(calculator.currentMonthName())")
                .font(.headline)
            
            Divider()
            
            Text("Progress: \(calculator.calculatePercentage())%")
            Text("Days remaining: \(calculator.daysRemaining())")
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
        .padding()
    }
}