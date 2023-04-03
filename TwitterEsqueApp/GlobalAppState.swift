//
//  GlobalAppState.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import Foundation

enum ViewType {
    case feed
    case postCreate
    case profile
}

class GlobalAppState: ObservableObject {
    @Published var currentView: ViewType = .feed
    @Published var currentUser: String? = UserDefaults.standard.string(forKey: "username")
    @Published var currentUserId: Int? = UserDefaults.standard.integer(forKey: "userId")
    @Published var posts: [UserPost] = [UserPost]()
}
