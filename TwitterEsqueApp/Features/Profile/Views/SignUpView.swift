//
//  SignUpView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/3/23.
//

import SwiftUI

struct SignUpView: View {
    @State private var usernameInput: String = ""
    @EnvironmentObject var gas: GlobalAppState
    private let createUserService = CreateUserService()
    
    var body: some View {
        VStack {
            Text("Hello! What is your name?")
            TextField("Username", text: $usernameInput)
            Button("Sign up") {
                createUserService.createUser(username: usernameInput, profilePic: "DummyValue") { username in
                    if(username != usernameInput) {
                        print("Something went wrong with creating this user!")
                    }
                    gas.currentUser = username
                    UserDefaults.standard.set(username, forKey: "username")
//                    gas.currentUserId = userId
//                    UserDefaults.standard.set(userId, forKey: "userId")
                }
            }
            Spacer()
        }
        .padding()
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
