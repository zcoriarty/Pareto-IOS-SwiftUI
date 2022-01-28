//
//  SendButton.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct SendButton: View {
    
    @Binding var text: String
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        Button(action: {
            self.sendMessage()
            
        }, label: {
            Image(systemName: "arrow.up.square.fill")
                .font(.system(size: 40))
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("ContentWords"))

        })
    }
    
    func sendMessage() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        model.sendMessage(text: text)
        
        text = ""
    }
}

//struct SendButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SendButton()
//    }
//}
