//
//  ChatRow.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct ChatRow: View {
    let type: MessageType
    
    var isSender : Bool {
        return type == .sent
    }
    
    let text: String
    
    init(text: String, type: MessageType) {
        self.text = text
        self.type = type
    }
    
    var body: some View {
        HStack {
            if isSender { Spacer() }
            
            if !isSender {
                VStack {
                    Spacer()
                    Circle()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.pink)
                }
            }
            HStack {
                Text(text)
                    .foregroundColor(isSender ? Color.white:
                                        Color(.label))
                    .padding()
                
            }
            .background(isSender ? Color.blue :
                            Color.gray)
            .padding(isSender ? .leading : .trailing, isSender ?
                     UIScreen.main.bounds.width/3 : UIScreen.main.bounds.width/5)
            .cornerRadius(6)
            
            if !isSender { Spacer() }
            
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChatRow(text: "yoohoo", type: .sent)
                .preferredColorScheme(.dark)
            ChatRow(text: "WHAT", type: .received)
                .preferredColorScheme(.dark)
        }
        
    }
}
