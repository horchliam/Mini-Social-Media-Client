//
//  GlobalAppState.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import Foundation

enum popUpType {
    case none
    case makePost
    case profile
}

class GlobalAppState: ObservableObject {
    @Published var currentUser: String? = UserDefaults.standard.string(forKey: "username")
//    @Published var currentUserId: Int? = UserDefaults.standard.integer(forKey: "userId")
    @Published var posts: [UserPost] = [UserPost]()
    @Published var outOfContent: Bool = false
    @Published var currentPopUp: popUpType = .none
}
