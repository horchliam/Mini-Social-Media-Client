//
//  PopUp.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/26/23.
//

import SwiftUI

struct PopUpView<PopUpContent: View, MainContent: View>: View {
    let popUpContent: PopUpContent
    let mainContent: MainContent
    let popUpWidth: CGFloat
    @EnvironmentObject var gas: GlobalAppState
    
    init(_ width: CGFloat, _ popUp: PopUpContent,
     _ mainContent: MainContent) {
        self.popUpWidth = width
        self.popUpContent = popUp
        self.mainContent = mainContent
    }
    
    var body: some View {
        ZStack {
            mainContent
                .overlay(
                    Group {
                        if(gas.currentPopUp != .none) {
                            MyColors.background
                                .ignoresSafeArea()
                                .opacity(0.5)
                                .onTapGesture {
                                    gas.currentPopUp = .none
                                }
                        }
                    }
                )
            popUpContent
                .frame(width: popUpWidth, height: popUpWidth, alignment: .center)
                .border(.black)
                .background(MyColors.background)
                .opacity(gas.currentPopUp != .none ? 1 : 0) // Disable if not shown
        }
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(200, {Text("Pop up")}(), {Text("Normal View")}())
    }
}

