//
//  CreatePostView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct CreatePostView: View {
    @State var postContent = ""
    @EnvironmentObject var gas: GlobalAppState
    let createPostService = CreatePostService()
    
    var body: some View {
        VStack {
            topPart
            TextAreaView("Placeholder", text: $postContent)
        }
        .padding()
    }
}

extension CreatePostView {
    var topPart: some View {
        HStack {
            Button {
                gas.currentView = .feed
            } label: {
                Text("Cancel")
            }
            .buttonStyle(.plain)

            Spacer()
            Text("42")
            
            Button {
                createPostService.createPost(userId: gas.currentUserId!, message: postContent)
            } label: {
                Rectangle()
                    .frame(width: 100, height: 40)
            }
            .buttonStyle(.plain)
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
