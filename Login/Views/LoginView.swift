//
//  LoginView.swift
//  Login
//
//  Created by Fernando dos Santos Motta on 14/08/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var registerView = RegisterView()
    
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
                    Text("Login")
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
                        Text("Não possui registo?")
                            .foregroundColor(Color.black.opacity(0.80))
                            .navigationBarBackButtonHidden(true)
                        NavigationLink("Registrar-se", destination: ContentView())
                    }
                    
                    Button("Entrar") {
                        registerView.loginUser(username, password)
                        print("Entrou")
                    }
                    .foregroundColor(.white)
                    .frame(width: 325, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
