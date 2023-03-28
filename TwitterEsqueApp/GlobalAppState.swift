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
}
