//
//  Conversation.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct Conversation: View {
    
    let usernames = ["aksdgf", "asdf"]
    @EnvironmentObject var model: AppStateModel
    @State var otherUsername: String = ""
    @State var showChat = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ForEach(usernames, id: \.self) {name in
                    NavigationLink(
                        destination: Chat(otherUsername: name),
                        label: {
                            HStack {
                                Circle()
                                    .frame(width: 65, height: 65)
                                    .foregroundColor(Color.pink)
                                
                                Text(name)
                                    .bold()
                                    .foregroundColor(Color(.label))
                                    .font(.system(size: 32))
                                
                                Spacer()
                            }
                            .padding()
                        })
                }
                
                if !otherUsername.isEmpty {
                    NavigationLink("", destination: Chat(otherUsername: otherUsername),
                                   isActive: $showChat)
                }
            }
            .navigationTitle("Conversations")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sign Out") {
                        self.signOut()
                    }
                }
                
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: Search{name in
                            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                                self.otherUsername = name
                                self.showChat = true
                            }
                        },
                        label: {
                            Image(systemName: "magnifyingglass")
                        })
                }
            }
            // THIS IS WHERE THE SIGNIN IS PROMPTED, CHANGE PENYA APP TO CONTENTVIEW
            .fullScreenCover(isPresented: $model.showingSignIn, content: {
                SignIn()
            })
        }
    }
    
    func signOut() {
        model.signOut()
    }
}

struct Conversation_Previews: PreviewProvider {
    static var previews: some View {
        Conversation()
            .preferredColorScheme(.dark)
    }
}