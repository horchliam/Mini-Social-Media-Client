//
//  TextAreaView.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 3/28/23.
//

import SwiftUI

struct TextAreaView: View {
    @Binding var text: String
    let placeHolder: String
    
    init(_ placeHolder: String, text: Binding<String>) {
        self.placeHolder = placeHolder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if(text.isEmpty) {
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 8)
            }
            
            TextEditor(text: $text)
        }
    }
}

struct TextAreaView_Previews: PreviewProvider {
    static var previews: some View {
        TextAreaView("Placeholder", text: .constant(""))
    }
}
