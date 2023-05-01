//
//  FeedView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var gas: GlobalAppState
    
    @State var readyToRequest = false
    @State var nextIndex = 1
    
    let getPostsService = GetPostsService()
    
    var body: some View {
        InfiniteScroll {
            ForEach(gas.posts, id:\.self.postId) { post in
                UserPostView(userPost: post)
            }
        } ptr: {
            readyToRequest = false
            getPostsService.getPosts(page: 0) { posts in
                gas.posts = posts
                nextIndex = 1
                gas.outOfContent = posts.count < 10
                readyToRequest = true
            }
        } br: {
            print("Bottom reached!")
            if(readyToRequest && !gas.outOfContent) {
                readyToRequest = false
                getPostsService.getPosts(page: nextIndex) { posts in
                    print("Got posts!")
                    if(posts.count < 10) {
                        gas.posts.append(contentsOf: posts)
                        gas.outOfContent = true
                    } else {
                        gas.posts.append(contentsOf: posts)
                        readyToRequest = true
                        nextIndex += 1
                    }
                }
            }
        }
        .onAppear {
            getPostsService.getPosts(page: 0) { posts in
                gas.posts = posts
                readyToRequest = true
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(GlobalAppState())
    }
}
