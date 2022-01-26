//
//  Search.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct Search: View {
    @Environment(\.presentationMode)  var presentationMode: Binding<PresentationMode>
    @State var text: String = ""
    
    let usernames = ["Julia"]
    
    let completion: ((String) -> Void)
    
    init (completion: @escaping ((String) -> Void)) {
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            TextField("Username...", text: $text)
                .modifier(CustomField())
            
            Button("Search") {
                
            }
            
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
