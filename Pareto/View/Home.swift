//
//  Home.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/21/22.
//

import SwiftUI

struct Home: View {
    
    @Binding var showMenu: Bool
    
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    
    var body: some View {
        
        VStack {
            Title(showMenu: $showMenu, topRight: "plus")
            

            ScrollView(.vertical, showsIndicators: false) {
                
                ValueGraph()
                
                HStack {
                    Text("Groups")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("ContentWords"))
                    Spacer()
                }

                LazyVGrid(columns: self.columns, spacing: 12) {
                                                
                    ForEach(data) {game in
                        
                        GridView(game: game, columns: self.$columns)
                    }
                }
                .padding(.top)
                    
                    
                
            }
            
        }
        .padding(.horizontal)
        .background(Color("BackgroundGray"))
        
    }
    
    @ViewBuilder
    func ValueGraph()->some View{
        
        VStack(spacing: 15){
            
            HStack{
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    // TODO: Get group name
                    Text("Investments")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("ContentWords"))
                    
                    Menu {
                        
                    } label: {
                        
                        Label {
                            Image(systemName: "chevron.down")
                        } icon: {
                            Text("Last 7 Days")
                        }
                        .font(.callout)
                        .foregroundColor(.gray)
                    }
                }
                Spacer()
            }
            
            LineGraph(data: myInvestmentData)
            // Max Size..
                .frame(height: 200)
                .padding(.top,10)
        }
        .padding(15)
        .background(
        
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("CellGray"))
        )
        .padding(.vertical,20)
    }
}


struct GridView : View {

    var game : Game
    @Binding var columns : [GridItem]
    @Namespace var namespace
    
    @State var showInDepth = false

    var body: some View{

        Button{
            self.showInDepth.toggle()
        } label: {
            HStack(){
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(game.name)
                        .padding(.leading)
                        .foregroundColor(Color("ContentWords"))
                    Text(game.id)
                        .fontWeight(.light)
                        .padding(.leading)
                        .foregroundColor(Color("ContentWords"))
                    Text(game.rating)
                        .fontWeight(.light)
                        .padding(.leading)
                        .foregroundColor(Color("ContentWords"))
                    

                }
                Spacer()
            }
            
            .padding(.top, 10)
            .padding(.bottom, 15)
            .background(Color("CellGray"))
            .cornerRadius(15)
            .shadow(radius: 0.20)
        }
        .sheet(isPresented: $showInDepth){
            GroupInDepth()
        }
        
    }
}
    


struct Game : Identifiable {
    var id : String
    var name : String
    var rating: String
    
}


// Get all tuples in database for the user here
var data = [
    Game(id: "Total profit: 1000", name: "Natasha", rating: "1 years experience"),
    Game(id: "Total profit: 100", name: "Zach", rating: "6 years experience"),
    Game(id: "Total profit: 00", name: "Chris", rating: "8 years experience"),
    Game(id: "Total profit: 1450", name: "Demi", rating: "7 years experience"),
    Game(id: "Total profit: 10", name: "Ada", rating: "0 years experience"),

]

// TODO: get live investment graph data here
let myInvestmentData: [CGFloat] = [

    989,1200,750,790,650,950,1200,600,500,600,890,1203,1400,900,1250,
1600,1200
]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
