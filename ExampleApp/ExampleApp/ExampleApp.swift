//
//  ExampleApp.swift
//  ExampleApp
//
//  Created by Hardik Kothari on 09.07.25.
//

import SwiftUI
import DevPanel

let environments: [AppEnvironment] = [
    .init(name: "Production", baseURL: "https://api.com", apiKey: "prod-key"),
    .init(name: "Staging", baseURL: "https://staging.api.com", apiKey: "staging-key"),
    .init(name: "Dev", baseURL: "http://localhost:3000", apiKey: "dev-key")
]

let appFlags: [FeatureFlag] = [
    .init(key: "featureFlag_newHome", name: "New Home UI"),
    .init(key: "featureFlag_darkMode", name: "Dark Mode")
]

@main
struct ExampleApp: App {
    
    @StateObject var devConfig = DevConfig(
        environments: environments,
        defaultEnvironment: environments.first!,
        featureFlags: appFlags
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .sheet(isPresented: .constant(true)) {
                    DevPanel(config: devConfig)
                }
        }
    }
}
