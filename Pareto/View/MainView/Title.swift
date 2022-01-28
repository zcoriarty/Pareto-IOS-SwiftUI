//
//  Title.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/23/22.
//

import SwiftUI

struct Title: View {
    
    @Binding var showMenu: Bool
    @State var topRight: String
    
    var body: some View {
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
            
        Spacer()
            
        Button {
            
        } label: {
            Image(systemName: topRight)
                .font(Font.subheadline.weight(.bold))
                .foregroundColor(Color("ContentWords"))
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(
                
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("CellGray"))
                )
        }
        
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
