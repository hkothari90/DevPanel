//
//  DevPanel.swift
//  DevPanel
//
//  Created by Hardik Kothari on 09.07.25.
//

import SwiftUI

public struct DevPanel: View {
    @ObservedObject var config: DevConfig
    
    public init(config: DevConfig) {
        self.config = config
    }
    
    public var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Environment")) {
                    Picker("Environment", selection: $config.selectedEnvironment) {
                        ForEach(config.environments, id: \.name) { env in
                            Text(env.name).tag(env)
                        }
                    }
                }
                
                Section(header: Text("Environment Config")) {
                    Text("Base URL: \(config.selectedEnvironment.baseURL)")
                    Text("API Key: \(config.selectedEnvironment.apiKey)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                Section(header: Text("Feature Flags")) {
                    ForEach(config.featureFlags.allFlags, id: \.key) { flag in
                        Toggle(flag.name, isOn: Binding(
                            get: { config.featureFlags.isEnabled(flag.key) },
                            set: { config.featureFlags.set(flag.key, enabled: $0) }
                        ))
                    }
                }
            }
            .navigationTitle("Dev Panel")
        }
    }
}
