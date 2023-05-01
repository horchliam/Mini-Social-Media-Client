//
//  PullToRefresh.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/24/23.
//
// https://stackoverflow.com/questions/56493660/pull-down-to-refresh-data-in-swiftui

import SwiftUI

struct PullToRefresh: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 50) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                } else {
                    Text("⬇️")
                }
                Spacer()
            }
        }.padding(.top, -50)
    }
}

struct PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                // do your stuff when pulled
            }
            
            Text("Some view...")
            ForEach(0...40, id: \.self) { x in
                Text("\(x)")
            }
        }.coordinateSpace(name: "pullToRefresh")
    }
}
