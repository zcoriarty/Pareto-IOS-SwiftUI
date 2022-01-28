//
//  Explore.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/21/22.
//

import SwiftUI

struct Explore: View {
    
    @Binding var showMenu: Bool

    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 1)
    @State var featureColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    @State var index = 0
    
    var body: some View {
        
            VStack {
                Title(showMenu: $showMenu, topRight: "magnifyingglass")
                
                    VStack {
                        
                        HStack {
                            Text("Featured")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("ContentWords"))
                            Spacer()
                        }
                        
                        
                        // Carousel List

                        TabView() {
                            ForEach(Array(zip(featureData.indices, featureData)), id: \.0) {index, feature in
                                    Featured(feature: feature, columns: self.$featureColumns)
//                                        .resizable()
    //                                    // adding animation
//                                        .frame(height: self.index == index ? 175 : 125)
    //                                    .cornerRadius(15)
                                        
                                        .padding(.horizontal, 10)
    //                                    // for identifying current index
                                        .tag(index)
                                
                                }
                            
                                                        
                        }
                        .frame(height: 175)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                        .tabViewStyle(PageTabViewStyle())
                        .animation(.easeOut, value: true)
//
                        
                    }
                    
                
                HStack {
                    Text("Following")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("ContentWords"))
                    Spacer()
                }
            
                // Vertical List
                ScrollView(.vertical, showsIndicators: false) {

                    LazyVGrid(columns: self.columns, spacing: 12) {
                                                    
                        ForEach(popular_data) {popular in
                            
                            PopularList(popular: popular, columns: self.$columns)
                        }
                    }
                    .padding(.top)
                        
                        
                    
                }
                
            }
            .padding(.horizontal)
            .background(Color("BackgroundGray"))
        
    }
}

struct PopularList : View {

    var popular : Popular
    @Binding var columns : [GridItem]
    @Namespace var namespace
    
    var body: some View{
                    
        HStack(){
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(popular.name)
                    .padding(.leading)
                    .foregroundColor(Color("ContentWords"))
                Text(popular.id)
                    .fontWeight(.light)
                    .padding(.leading)
                    .foregroundColor(Color("ContentWords"))
                Text(popular.rating)
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
    }
}
    


struct Popular : Identifiable {
    var id : String
    var name : String
    var rating: String
    
}


// Get all popular tuples in database here
var popular_data = [
    Popular(id: "Total profit: 1000", name: "Kourtney", rating: "1 years experience"),
    Popular(id: "Total profit: 100", name: "Sarah", rating: "6 years experience"),
    Popular(id: "Total profit: 00", name: "Devon", rating: "8 years experience"),
    Popular(id: "Total profit: 1450", name: "Kylie", rating: "7 years experience"),
    Popular(id: "Total profit: 10", name: "Kim", rating: "0 years experience"),

]


struct Featured : View {

    
    
    var feature : Feature
    
    @Binding var columns : [GridItem]
    
    var body: some View {
        
            
            VStack(alignment: .leading, spacing: 25) {
                
                HStack{
                    Image(systemName: feature.image)
                        .font(.caption.bold())
                        .foregroundColor(Color(feature.color))
                        .padding(6)
                        .background(Color("ContentWords"))
                        .cornerRadius(8)
                    
                    Text(feature.id)
                }
                
                Text(feature.profit)
                    .font(.title.bold())
            }
            .foregroundColor(Color("ContentWords"))
            .padding(.vertical,22)
            .padding(.horizontal,18)
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .leading)
            .background(Color("Primary")) //TODO: make the blue brighter
            .cornerRadius(15)
        
}
}

struct Feature : Identifiable {
    
    var id : String
    var profit : String
    var image : String
    var color : String
}


// TODO: get live key metrics here
var featureData = [

    Feature(id: "@nattyb", profit: "87.57K", image: "checkmark", color: "Primary"),
    
    Feature(id: "Profit Days", profit: "22", image: "number", color: "Primary"),
    
    Feature(id: "Total Profit", profit: "$1,800", image: "chart.line.uptrend.xyaxis", color: "Primary"),
    
    Feature(id: "Founder", profit: "@nattyb", image: "person", color: "Primary"),
    
    Feature(id: "1Y Target", profit: "$5000", image: "scope", color: "Primary"),
    
    Feature(id: "Sentiment", profit: ".92", image: "newspaper", color: "Primary"),
    
]


struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
