//
//  FeatureFlagManager.swift
//  DevPanel
//
//  Created by Hardik Kothari on 09.07.25.
//

import Foundation

public final class FeatureFlagManager: ObservableObject {
    private let defaults: UserDefaults
    private let flags: [FeatureFlag]

    public init(defaults: UserDefaults, flags: [FeatureFlag]) {
        self.defaults = defaults
        self.flags = flags
    }

    public func isEnabled(_ key: String) -> Bool {
        defaults.bool(forKey: key)
    }

    public func set(_ key: String, enabled: Bool) {
        defaults.set(enabled, forKey: key)
        objectWillChange.send()
    }

    public var allFlags: [FeatureFlag] {
        flags
    }
}
