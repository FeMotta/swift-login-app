//
//  ContentView.swift
//  Login
//
//  Created by Fernando dos Santos Motta on 13/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var registerView = RegisterView()
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var hideBar = true
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(Color.white)
                
                VStack {
                    Text("Registro")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Usuario", text: $username)
                        .padding()
                        .frame(width: 325, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongUsername))
                    
                    SecureInputView("Senha", text: $password)
                    
                    HStack {
                        Text("Já possui Registo?")
                            .foregroundColor(Color.black.opacity(0.80))
                        NavigationLink("Entrar", destination: LoginView())
                            .gesture(TapGesture().onEnded {
                                self.hideBar = false
                            })
                    }
                    
                    Button("Registrar") {
                        registerView.registerUser(username, password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 325, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }
            }
        }
        .navigationBarHidden(hideBar)
        .onAppear {
            self.hideBar = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}

