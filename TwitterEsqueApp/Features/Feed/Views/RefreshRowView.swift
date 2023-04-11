//
//  RefreshRowView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct RefreshRowView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    let getPostsService = GetPostsService()
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                print("Refresh pressed")
                getPostsService.getPosts { posts in
                    gas.posts = posts
                }
            } label: {
                Rectangle()
                    .frame(width: 34, height: 34)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

struct RefreshRowView_Previews: PreviewProvider {
    static var previews: some View {
        RefreshRowView()
    }
}
