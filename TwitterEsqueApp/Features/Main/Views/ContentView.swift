//
//  ContentView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    var popUpViewWidth: CGFloat {
        switch gas.currentPopUp {
        case .makePost:
            return UIScreen.main.bounds.size.width - 20
        case .profile:
            return 200
        case .none:
            return 0
        }
    }
    var body: some View {
        PopUpView(popUpViewWidth,
                  popUpContent,
                  mainContent)
    }
}

extension ContentView {
    var mainContent: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                TopNavBarView()
                
                FeedView()
            }
            
            TopNavBarButtonView {
                print("Make a post!")
                gas.currentPopUp = .makePost
            }
            .padding()
            
        }
    }
}

extension ContentView {
    var popUpContent: some View {
        Group {
            switch gas.currentPopUp {
            case .profile:
                ProfileView()
            case .makePost:
                CreatePostView()
            case .none:
                EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GlobalAppState())
    }
}
