//
//  RegisterView.swift
//  Login
//
//  Created by Fernando dos Santos Motta on 14/08/22.
//

import SwiftUI
import FirebaseAuth

struct RegisterView {
    
    func registerUser(_ username: String,_ password: String) {
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            }
        }
    }
    
    func loginUser(_ username: String,_ password: String) {
        Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            }
        }
    }
    
    
}

