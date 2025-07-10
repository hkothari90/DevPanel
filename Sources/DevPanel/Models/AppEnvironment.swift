//
//  AppEnvironment.swift
//  DevPanel
//
//  Created by Hardik Kothari on 09.07.25.
//

import SwiftUI

public struct AppEnvironment: Hashable {
    public let name: String
    public let baseURL: String
    public let apiKey: String
    
    public init(name: String, baseURL: String, apiKey: String) {
        self.name = name
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
}
