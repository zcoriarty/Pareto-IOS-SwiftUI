//
//  ChatRow.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct ChatRow: View {
    let type: MessageType
    @EnvironmentObject var model: AppStateModel
    
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
                    // model.image
                    Image("")//add a real image to the model
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color.pink)
                        .clipShape(Circle())
                }
            }
            HStack {
                Text(text)
                    .foregroundColor(isSender ? Color.white:
                                        Color(.label))
                    .padding()
            }
            .background(isSender ? Color("Primary") :
                            Color("CellGray"))
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
