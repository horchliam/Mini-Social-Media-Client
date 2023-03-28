//
//  ContentView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    var body: some View {
        VStack(spacing: 0) {
            TopNavBarView()
                .background(Color.blue)
            Group {
                switch(gas.currentView) {
                case .profile:
                    VStack {
                        Text("Profile View")
                        Spacer()
                    }
                    .padding()
                case .postCreate:
                    CreatePostView()
                case .feed:
                    FeedView()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GlobalAppState())
    }
}
