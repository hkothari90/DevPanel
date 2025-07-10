//
//  DevConfig.swift
//  DevPanel
//
//  Created by Hardik Kothari on 09.07.25.
//

import Foundation

public final class DevConfig: ObservableObject {
    private let defaults = UserDefaults.standard
    private let environmentKey = "debug_environment_key"

    public let environments: [AppEnvironment]
    public let featureFlags: FeatureFlagManager

    @Published public var selectedEnvironment: AppEnvironment {
        didSet {
            defaults.set(selectedEnvironment.name, forKey: environmentKey)
        }
    }

    public init(environments: [AppEnvironment], defaultEnvironment: AppEnvironment, featureFlags: [FeatureFlag]) {
        self.environments = environments
        self.featureFlags = FeatureFlagManager(defaults: defaults, flags: featureFlags)

        let savedName = defaults.string(forKey: environmentKey)
        self.selectedEnvironment = environments.first(where: { $0.name == savedName }) ?? defaultEnvironment
    }
}
