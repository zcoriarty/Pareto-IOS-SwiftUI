//
//  SignIn.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct SignIn: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Heading
                Image(systemName: "plus") // logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                Text("Penya")
                    .bold()
                    .font(.system(size: 34))
                
                VStack {
                    TextField("Username", text: $username)
                        .modifier(CustomField())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .modifier(CustomField())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button(action: {
                        self.signIn()
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 220, height: 50)
                            .background(Color.blue)
                            .cornerRadius(6)
                    })
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Text("New to Penya?")
                    NavigationLink("Create Account", destination: SignUp())
                }
            }
        }
        
        
    }
    func signIn() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else { //require password length 6
                  return
              }
        
        model.signIn(username: username, password: password)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
