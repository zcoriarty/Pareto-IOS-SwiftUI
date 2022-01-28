//
//  Search.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct Search: View {
    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var model: AppStateModel
    @State var text: String = ""
    
    @State var usernames: [String] = []
    
    let completion: ((String) -> Void)
    
    init (completion: @escaping ((String) -> Void)) {
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            HStack {
            TextField("Username...", text: $text)
                .disableAutocorrection(true)
                
            Spacer()
            Button {
                guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                    return
                }
                
                model.searchUsers(queryText: text) { usernames in
                    self.usernames = usernames
                }
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("Primary"))
            }
            }.modifier(CustomField())
            
            List {
                ForEach(usernames, id: \.self) {name in
                    HStack {
                        Circle()
                            .frame(width: 55, height: 55)
                            .foregroundColor(Color.green)
                        
                        Text(name)
                            .font(.system(size: 24))
                        
                        Spacer()
                    }
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                        completion(name)
                    }
                }
            }
        }
        .navigationTitle("Search")
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search(){ _ in}
            .preferredColorScheme(.dark)
    }
}
