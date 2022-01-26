//
//  Chat.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct CustomField: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(7)
    }
}

struct Chat: View {
//    @Binding var showMenu: Bool

    @State var message: String = ""
    let otherUsername: String
    
    init(otherUsername: String) {
        self.otherUsername = otherUsername
    }
    
    var body: some View {
//        VStack {
//            Title(showMenu: $showMenu, topRight: "plus")
//            Spacer()
//        }
//        .padding(.horizontal)
//        .background(Color("BackgroundGray"))
        VStack {
            ScrollView(.vertical) {
                ChatRow(text: "hello World", type: .sent)
                    .padding(3)
                ChatRow(text: "hello World", type: .received)
                    .padding(3)
                
            }
            
            // send button
            HStack {
                TextField("Message...", text: $message)
                    .modifier(CustomField())
                
                SendButton(text: $message)
            }
            .padding()
        }
        .navigationTitle(otherUsername)
        
        
        
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat(otherUsername: "Samantha")
            .preferredColorScheme(.dark)
    }
}
