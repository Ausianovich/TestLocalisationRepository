//
//  Bundle_LocalizeAppName.swift
//  TestLocalisationProject
//
//  Created by Kanstantsin Ausianovich on 22.06.22.
//

import Foundation

extension Bundle {
    
    public func text(forKey key: String, inTable table: String, forLanguage language: String, withDefault defaultText: String? = nil) -> String {
        var bundleURL = self.url(forResource: table, withExtension: "strings", subdirectory: nil, localization: language)
        if bundleURL == nil {
            bundleURL = self.url(forResource: table, withExtension: "strings", subdirectory: nil, localization: "en")
        }
        
        guard let bundleURL = bundleURL,
              let dataBundle = Bundle(url: bundleURL.deletingLastPathComponent()) else {
            
            return ""
        }

        return self.text(forKey: key, inBundle: dataBundle, inTable: table, withDefault: defaultText)

    }
    
    private func text(forKey key: String, inBundle bundle: Bundle, inTable table: String, withDefault defaultText: String? = nil) -> String {
        let value = bundle.localizedString(forKey: key, value: defaultText, table: table)
        
        return value
    }
}
