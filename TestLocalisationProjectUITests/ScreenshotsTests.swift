//
//  ScreenshotsTests.swift
//  TestLocalisationProjectUITests
//
//  Created by Kanstantsin Ausianovich on 22.06.22.
//

import XCTest

class ScreenshotsTests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        self.deleteApp()
        
        continueAfterFailure = false
        self.app = XCUIApplication()
        
        //Reset Authorisation status of camera and photo gallery
        if #available(iOS 13.4, *) {
            self.app.resetAuthorizationStatus(for: .camera)
            self.app.resetAuthorizationStatus(for: .photos)
        }
    }
    
    override func tearDown() {
        self.app = nil

        self.deleteApp()
        super.tearDown()
    }
    
    private func deleteApp() {
        let currentSystemLocaleIdentifier: String = String(Locale.current.identifier.prefix(2))
        let testBundle = Bundle(for: type(of: self ))
        let appName = testBundle.text(forKey: "CFBundleDisplayName", inTable: "InfoPlist", forLanguage: currentSystemLocaleIdentifier)
        Springboard.deleteApp(appName)
    }
    
    private func takeScreenshot(name: String) {
      let fullScreenshot = XCUIScreen.main.screenshot()

      let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(name)-\(UIDevice.current.name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
      screenshot.lifetime = .keepAlways
      add(screenshot)
    }
    
    func testMakeUKScreenshot() {
        self.app.launchArguments += ["-AppleLanguages", "(uk)", "-AppleLocale", "uk_UK"]
        self.app.launch()
        
        self.takeScreenshot(name: "Main_screen")
    }
    
    func testMakeENScreenshot() {
        self.app.launchArguments += ["-AppleLanguages", "(en)", "-AppleLocale", "en_US"]
        self.app.launch()
        
        self.takeScreenshot(name: "Main_screen")
    }

}
