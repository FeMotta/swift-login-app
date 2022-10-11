//
//  ContentView.swift
//  Login
//
//  Created by Fernando dos Santos Motta on 13/08/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    
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
                    
                    SecureField("Senha", text: $password)
                        .padding()
                        .frame(width: 325, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(Color.red, width: CGFloat(wrongPassword))
                    
                    HStack {
                        Text("Já possui Registo?")
                            .foregroundColor(Color.black.opacity(0.80))
                        Button("Logar") {
                            
                        }
                    }
                    
                    Button("Registrar") {
                        registerUser(username, password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 325, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top)
                    
                    NavigationLink(destination: Text("Você esta logado como @\(username)"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func registerUser(_ username: String,_ password: String) {
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                showingLoginScreen = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
