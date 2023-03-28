//
//  ProfileView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center) {
            Rectangle()
                .frame(width: 100, height: 100)
            Text("Name")
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
