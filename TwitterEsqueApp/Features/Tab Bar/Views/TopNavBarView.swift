//
//  TopNavBarView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct TopNavBarView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                TopNavBarButtonView {
                    gas.currentView = .profile
                }
                
                Spacer()
                
                TopNavBarButtonView {
                    gas.currentView = .feed
                }
                
                Spacer()
                
                TopNavBarButtonView {
                    gas.currentView = .postCreate
                }
            }
            .padding()
            Rectangle()
                .frame(height: 2)
        }
    }
}

struct TopNavBarButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Rectangle()
                .frame(width: 40, height: 40)
        }
        .buttonStyle(.plain)

    }
}

struct TopNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavBarView()
    }
}
