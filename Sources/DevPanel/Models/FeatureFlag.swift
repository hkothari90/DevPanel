//
//  FeatureFlag.swift
//  DevPanel
//
//  Created by Hardik Kothari on 09.07.25.
//

import SwiftUI

public struct FeatureFlag: Hashable {
    public let key: String
    public let name: String
    public let isOn: Bool

    public init(key: String, name: String) {
        self.key = key
        self.name = name
        self.isOn = true
    }
}
