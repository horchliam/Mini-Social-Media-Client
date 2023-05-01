//
//  TwitterEsqueAppApp.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin
import AWSS3StoragePlugin

@main
struct TwitterEsqueAppApp: App {
    @StateObject var gas: GlobalAppState = GlobalAppState()
    
    init() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
            print("Amplify configured with Auth and Storage plugins")
        } catch {
            print("Failed to initialize Amplify with \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(gas)
            //                .onAppear {
            //                    UserDefaults.standard.set(nil, forKey: "username")
            //                }
        }
    }
}
