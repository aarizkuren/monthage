import XCTest
@testable import Monthage

final class LaunchHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let plistURL = FileManager.default
            .homeDirectoryForCurrentUser
            .appendingPathComponent("Library/LaunchAgents/com.example.monthage.launcher.plist")
        try? FileManager.default.removeItem(at: plistURL)
        try? runLaunchCtl(load: false)
    }
    
    override func tearDown() {
        let plistURL = FileManager.default
            .homeDirectoryForCurrentUser
            .appendingPathComponent("Library/LaunchAgents/com.example.monthage.launcher.plist")
        try? FileManager.default.removeItem(at: plistURL)
        try? runLaunchCtl(load: false)
        super.tearDown()
    }
    
    func testToggleEnablesAndDisables() {
        XCTAssertFalse(LaunchHelper.isEnabled)
        
        LaunchHelper.toggle()
        XCTAssertTrue(LaunchHelper.isEnabled)
        
        LaunchHelper.toggle()
        XCTAssertFalse(LaunchHelper.isEnabled)
    }
    
    private func runLaunchCtl(load: Bool) throws {
        let task = Process()
        task.launchPath = "/bin/launchctl"
        let plistURL = FileManager.default
            .homeDirectoryForCurrentUser
            .appendingPathComponent("Library/LaunchAgents/com.example.monthage.launcher.plist")
        task.arguments = load
            ? ["load", plistURL.path]
            : ["unload", plistURL.path]
        try task.run()
        task.waitUntilExit()
    }
}