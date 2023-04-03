//
//  TwitterEsqueAppApp.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

@main
struct TwitterEsqueAppApp: App {
    @StateObject var gas: GlobalAppState = GlobalAppState()
    
    var body: some Scene {
        WindowGroup {
            if let _ = gas.currentUser {
                ContentView()
                    .environmentObject(gas)
            } else {
                SignUpView()
                    .environmentObject(gas)
            }
        }
    }
}
