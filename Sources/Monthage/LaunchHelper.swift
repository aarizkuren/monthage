import Foundation

/// Manages LaunchAgent for starting Monthage at login
struct LaunchHelper {
    private static let agentLabel = "com.example.monthage.launcher"
    
    private static var plistURL: URL {
        FileManager.default
            .homeDirectoryForCurrentUser
            .appendingPathComponent("Library/LaunchAgents/\(agentLabel).plist")
    }
    
    private static var executableURL: URL {
        Bundle.main.bundleURL
            .appendingPathComponent("Contents/MacOS/Monthage")
    }
    
    static var isEnabled: Bool {
        FileManager.default.fileExists(atPath: plistURL.path)
    }
    
    static func toggle() {
        if isEnabled {
            disable()
        } else {
            enable()
        }
    }
    
    private static func enable() {
        let plist: [String: Any] = [
            "Label": agentLabel,
            "ProgramArguments": [executableURL.path],
            "RunAtLoad": true,
            "KeepAlive": false,
            "StandardOutPath": "/dev/null",
            "StandardErrorPath": "/dev/null"
        ]
        
        guard let data = try? PropertyListSerialization.data(
            fromPropertyList: plist,
            format: .xml,
            options: 0
        ) else { return }
        
        let agentDir = plistURL.deletingLastPathComponent()
        try? FileManager.default.createDirectory(
            at: agentDir,
            withIntermediateDirectories: true
        )
        
        try? data.write(to: plistURL)
        runLaunchCtl(load: true)
    }
    
    private static func disable() {
        runLaunchCtl(load: false)
        try? FileManager.default.removeItem(at: plistURL)
    }
    
    private static func runLaunchCtl(load: Bool) {
        let task = Process()
        task.launchPath = "/bin/launchctl"
        task.arguments = load
            ? ["load", plistURL.path]
            : ["unload", plistURL.path]
        try? task.run()
        task.waitUntilExit()
    }
}