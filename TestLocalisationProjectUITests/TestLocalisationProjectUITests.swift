//
//  TestLocalisationProjectUITests.swift
//  TestLocalisationProjectUITests
//
//  Created by Kanstantsin Ausianovich on 21.06.22.
//

import XCTest
@testable import TestLocalisationProject

class TestLocalisationProjectUITests: XCTestCase {
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
    
    //MARK: - Common methods
    
    private func checkStaticText(_ identifier: String, wait timeout: TimeInterval = 0.0, font: UIFont? = nil, numberOfLines: Int = 0) {

        let label = self.app.staticTexts[identifier]
        if timeout > 0.0 {
            _ = label.waitForExistence(timeout: timeout)
        }
        
        if let font = font {
            XCTAssertFalse(self.checkIsTruncatedUILabel(with: identifier, font: font, labelSize: label.frame.size, numberOfLines: numberOfLines))
        }

        XCTAssertTrue(label.exists, "Don't find \(identifier)")
    }
    
    private func checkIsTruncatedUILabel(with text: String, font: UIFont, labelSize: CGSize, numberOfLines: Int = 0) -> Bool {
        let textSize = (text as NSString).boundingRect(with: CGSize(width: labelSize.width, height: .greatestFiniteMagnitude),
                                                       options: numberOfLines > 0 ? .usesDeviceMetrics : .usesLineFragmentOrigin,
                                                       attributes: [.font: font],
                                                       context: nil).size
        
        return textSize.height > labelSize.height || textSize.width > labelSize.width
    }
    
    func testUKLocalization() throws {
        self.app.launchArguments += ["-AppleLanguages", "(uk)", "-AppleLocale", "uk_UK"]
        self.app.launch()
        
        self.checkStaticText("test_key_ukrainian", wait: 2.0)
    }
    
    func testENLocalization() throws {
        self.app.launchArguments += ["-AppleLanguages", "(en)", "-AppleLocale", "en_US"]
        self.app.launch()
        
        self.checkStaticText("test_key_english", wait: 2.0)
    }
}
