//
//  InfiniteScroll.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/25/23.
//

import SwiftUI

struct InfiniteScroll<MainContent: View>: View {
    @EnvironmentObject var gas: GlobalAppState
    
    let mainContent: MainContent
    let pulledToRefresh: () -> ()
    let bottomReached: () -> ()
    
    init(@ViewBuilder _ mainContent: () -> MainContent,
         ptr pulledToRefresh: @escaping () -> (),
         br bottomReached: @escaping () -> ()) {
        self.mainContent = mainContent()
        self.pulledToRefresh = pulledToRefresh
        self.bottomReached = bottomReached
    }
    
    var body: some View {
        ScrollView {
            VStack {
                PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                    pulledToRefresh()
                }
                LazyVStack {
                    
                    mainContent
                    
                    Color.clear
                        .frame(width: 0, height: 0, alignment: .bottom)
                        .onAppear {
                            bottomReached()
                        }
                    
                    if(gas.outOfContent) {
                        Text("Out of content!")
                            .padding()
                    }
                }
            }
        }
        .coordinateSpace(name: "pullToRefresh")
    }
}

struct InfiniteScroll_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteScroll({ Text("Hi back!") }, ptr: {}, br: {})
            .environmentObject(GlobalAppState())
    }
}
