//
//  Springboard.swift
//  TestLocalisationProjectUITests
//
//  Created by Kanstantsin Ausianovich on 22.06.22.
//

import XCTest

public class Springboard {
    private static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    private init() {}
    
    public class func deleteApp(_ name: String) {
        // Terminate the application
        XCUIApplication().terminate()
        
        self.springboard.activate()
        
        // Find the appIcon in the springboard's list of icons
        let appIcon = springboard.icons[name]
        
        // If it exists then we long press it to bring up the context menu
        guard appIcon.exists else { return }
        appIcon.press(forDuration: 1.3)
        
        // Tap the "Remove App" button on the context menu
        self.pressButton(at: 1, wait: 3.0)
        
        if #available(iOS 14.0, *) {
            // Tap the "Delete App" button on the alert
            self.pressAlertButton(at: 0, wait: 3.0)
            // Tap the "Delete" button on the alert
            self.pressAlertButton(at: 1, wait: 3.0)
        } else {
            // Tap the "Delete App" button on the alert
            self.pressAlertButton(at: 1, wait: 3.0)
        }

        
        // Tap home to stop all the icons from wiggling
        XCUIDevice.shared.press(.home)
    }
    
    public class func pressButton(at index: Int, wait timeout: TimeInterval = 0.0) {
        let button = self.springboard.buttons.element(boundBy: index)
        if timeout > 0.0 {
            _ = button.waitForExistence(timeout: timeout)
        }
        button.tap()
    }
    
    public class func pressButton(withLabel label: String, wait timeout: TimeInterval = 0.0) {
        let button = self.springboard.buttons[label]
        if timeout > 0.0 {
            _ = button.waitForExistence(timeout: timeout)
        }
        button.tap()
    }
    
    public class func pressAlertButton(at index: Int, wait timeout: TimeInterval = 0.0) {
        let button = self.springboard.alerts.buttons.element(boundBy: index)
        if timeout > 0.0 {
            _ = button.waitForExistence(timeout: timeout)
        }
        button.tap()
    }
    
    public class func pressAlertButton(withLabel label: String, wait timeout: TimeInterval = 0.0) {
        let button = self.springboard.alerts.buttons[label]
        if timeout > 0.0 {
            _ = button.waitForExistence(timeout: timeout)
        }
        button.tap()
    }
}

