//
//  RootView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/4/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    var body: some View {
        Group {
            if let _ = gas.currentUser {
                ContentView()
            } else {
                SignUpView()
            }
        }
        .ignoresSafeArea()
        .statusBarHidden()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
