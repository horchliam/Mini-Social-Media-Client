//
//  UserPostView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct UserPost: Decodable, Hashable {
    let postId: Int
    let username: String
    let message: String
    let createdAt: String?
}

struct UserPostView: View {
    var userPost: UserPost
    var body: some View {
        HStack(alignment: .top) {
            Rectangle()
                .frame(width: 56, height: 56)
            textualContent
        }
        .padding()
    }
}

extension UserPostView {
    var textualContent: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("\(userPost.username)")
                Spacer()
            }
            Text(userPost.message)
        }
        .font(.system(size: 14))
    }
}

struct UserPostView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostView(userPost: UserPost(postId: 1, username: "Steve", message: "Message", createdAt: nil))
    }
}
