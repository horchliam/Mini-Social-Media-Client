//
//  FeedView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    let getPostsService = GetPostsService()

    var body: some View {
        ScrollView {
            LazyVStack {
                RefreshRowView()
                ForEach(gas.posts.reversed(), id:\.self) { post in
                    UserPostView(userPost: post)
                }
            }
        }
        .onAppear {
            getPostsService.getPosts { posts in
                gas.posts = posts
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
