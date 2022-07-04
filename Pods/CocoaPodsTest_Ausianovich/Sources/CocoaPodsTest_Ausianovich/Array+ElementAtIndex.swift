//
//  Array+ElementAtIndex.swift
//  SettingsScreenSample
//
//  Created by Kanstantsin Ausianovich on 27.06.22.
//

import Foundation

extension Array {
    public func element(at index: Int) -> Element? {
        if self.indices.contains(index) {
            return self[index]
        } else {
            return nil
        }
    }
}
