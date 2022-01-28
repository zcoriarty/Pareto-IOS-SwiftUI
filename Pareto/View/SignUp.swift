//
//  SignUp.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct SignUp: View {
    
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        
        VStack {
            // Heading
            Image(systemName: "plus") // logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
            Text("Create Account")
                .bold()
                .font(.system(size: 34))
            
            VStack {
                TextField("Email Address", text: $email)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                TextField("Username", text: $username)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .modifier(CustomField())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Button(action: {
                    self.signUp()
                }, label: {
                    Text("Sign Up")
                        .foregroundColor(Color.black)
                        .frame(width: 220, height: 50)
                        .background(Color.white)
                        .cornerRadius(6)
                })
                    .padding(50)
            }
            .padding()
            
            Spacer()
            
        }
    }
    
    

    func signUp() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              password.count >= 6 else { //require password length 6
                  return
              }
        model.signUp(email: email, username: username, password: password)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
