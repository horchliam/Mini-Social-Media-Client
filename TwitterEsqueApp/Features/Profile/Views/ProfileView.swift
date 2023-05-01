//
//  ProfileView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var gas: GlobalAppState
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Rectangle()
                .frame(width: 100, height: 100)
            Text(gas.currentUser ?? "How do you have no name?")
            Spacer()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
