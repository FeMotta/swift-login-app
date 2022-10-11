//
//  SecureField.swift
//  Login
//
//  Created by Fernando dos Santos Motta on 14/08/22.
//

import SwiftUI

struct SecureField: View {
    
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var title: String
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if isSecured {
                    SecureField(title, text: $text)
                } else {
                    TextField(title, text: $text)
                }
            }.padding(.trailing, 32)

            Button(action: {
                isSecured.toggle()
            }) {
            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                .accentColor(.gray)
            }
        }
    }
}

struct SecureField_Previews: PreviewProvider {
  
    static var previews: some View {
        ContentView()
    }
}
