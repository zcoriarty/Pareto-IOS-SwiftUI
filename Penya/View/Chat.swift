//
//  Chat.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct Chat: View {
    @Binding var showMenu: Bool
    var body: some View {
        VStack {
            Title(showMenu: $showMenu, topRight: "plus")
            Spacer()
        }
        .padding(.horizontal)
        .background(Color("BackgroundGray"))
        
        
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
