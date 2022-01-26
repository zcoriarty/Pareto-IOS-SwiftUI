//
//  AppStateModel.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import Foundation
import SwiftUI

import FirebaseAuth
import FirebaseFirestore

class AppStateModel: ObservableObject {
    @AppStorage("currentUsername") var currentUsername: String = ""
    @AppStorage("currentEmail") var currentEmail: String = ""
    // Is user signed in
    @Published var showingSignIn: Bool = true
    @Published var conversations: [String] = []
    @Published var messages: [Message] = []
    
    let database = Firestore.firestore()
    let auth = Auth.auth()
    
    var otherUsername = ""
    // Current user being chatted with
    // Messages, Conversations
    
    init() {
        self.showingSignIn = Auth.auth().currentUser == nil
    }
    
}

// Search

extension AppStateModel {
    func searchUsers(queryText: String, completion: @escaping ([String]) -> Void) {
        
    }
}

// Conversations

extension AppStateModel {
    func getConversations() {
        // Listen for conversations
    }
}

// Get chat/ send messages

extension AppStateModel {
    func observeChat() {
        
    }
    
    func sendMessage(text: String) {
        
    }
    
    func createConversationIfNeeded() {
        
    }
}

// Sign in and sign up

extension AppStateModel {
    func signIn(username: String, password: String) {
        // Get email from db
        database.collection("users").document(username).getDocument { [weak self] snapshot, error in
            guard let email = snapshot?.data()?["email"] as? String, error == nil else {
                return
            }
            
            // Try to sign in
            self?.auth.signIn(withEmail: email, password: password, completion: { result, error in
                guard error == nil, result != nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.currentEmail = email
                    self?.currentUsername = username
                    self?.showingSignIn = false
                }
            })
        }
    }
    
    func signUp(email: String, username: String, password: String) {
        // Create Account
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
    
            // Insert user into database
            let data = [
                "email": email,
                "username": username
            ]
            
            self?.database
                .collection("users")
                .document(username)
                .setData(data) { error in
                    guard error == nil else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        self?.currentUsername = username
                        self?.currentEmail = email
                        self?.showingSignIn = false
                    }
                }
        }
        
        
    }
    
    func signOut() {
        do {
            try auth.signOut()
            self.showingSignIn = true
        }
        catch {
            print(error)
        }
    }
}
