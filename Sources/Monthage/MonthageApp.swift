import SwiftUI

@main
struct MonthageApp: App {
    var body: some Scene {
        MenuBarExtra {
            MenuContent()
        } label: {
            // Custom text label for menubar
            Text("📅 \(calculateMonthPercentage())%")
                .font(.system(.body, design: .monospaced))
        }
        .menuBarExtraStyle(.menu)
    }
}

struct MenuContent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Mes: \(currentMonthName())")
                .font(.headline)
            
            Divider()
            
            Text("Progreso: \(calculateMonthPercentage())%")
            Text("Días restantes: \(daysRemaining())")
            
            Divider()
            
            Button("Salir") {
                NSApplication.shared.terminate(nil)
            }
            .keyboardShortcut("q")
        }
        .padding()
    }
}

func calculateMonthPercentageText() -> String {
    "\(calculateMonthPercentage())%"
}

func calculateMonthPercentage() -> Int {
    let calendar = Calendar.current
    let now = Date()
    
    guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: now)),
          let startOfNextMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth) else {
        return 0
    }
    
    let totalSeconds = startOfNextMonth.timeIntervalSince(startOfMonth)
    let elapsedSeconds = now.timeIntervalSince(startOfMonth)
    
    guard totalSeconds > 0 else { return 0 }
    return Int((elapsedSeconds / totalSeconds) * 100)
}

func daysRemaining() -> Int {
    let calendar = Calendar.current
    let now = Date()
    guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: now)),
          let startOfNextMonth = calendar.date(byAdding: .month, value: 1, to: startOfMonth) else { return 0 }
    return calendar.dateComponents([.day], from: now, to: startOfNextMonth).day ?? 0
}

func currentMonthName() -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateFormat = "MMMM yyyy"
    return formatter.string(from: Date()).capitalized
}