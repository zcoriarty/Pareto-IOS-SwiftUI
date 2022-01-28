//
//  Profile.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/24/22.
//

import SwiftUI

struct Profile: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    withAnimation{showMenu.toggle()}
                } label: {
                    Image(systemName: "square.filled.and.line.vertical.and.square")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("ContentWords"))
                    
                }
                

                
            Spacer()
            Text("Pareto")
                .font(.system(size: 25.0))
                .foregroundColor(Color("Primary"))
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
