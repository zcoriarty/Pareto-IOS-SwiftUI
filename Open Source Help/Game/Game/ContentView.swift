//
//  ContentView.swift
//  Game
//
//  Created by Balaji on 26/06/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View{

        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVStack{
                
                HStack{
                    
                    Text("Game Store")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TextField("Search", text: self.$search)
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top,25)
                
                // Carousel List...
                
                TabView(selection: self.$index){
                    
                    ForEach(0...5,id: \.self){index in
                        
                        Image("p\(index)")
                            .resizable()
                            // adding animation...
                            .frame(height: self.index == index ?  230 : 180)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            // for identifying current index....
                            .tag(index)
                    }
                }
                .frame(height: 230)
                .padding(.top,25)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                
                // adding custom Grid....
                
                HStack{
                    
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        
                        // reducing to row.....
                        
                        withAnimation(.easeOut){
                            
                            if self.columns.count == 2{
                                
                                self.columns.removeLast()
                            }
                            else{
                                
                                self.columns.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                        
                    } label: {
                    
                        Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }

                }
                .padding(.horizontal)
                .padding(.top,25)
                
                LazyVGrid(columns: self.columns,spacing: 25){
                    
                    ForEach(data){game in
                        
                        // GridView....
                        
                        GridView(game: game,columns: self.$columns)
                    }
                }
                .padding([.horizontal,.top])
                
            }
            .padding(.vertical)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
}

struct GridView : View {

    var game : Game
    @Binding var columns : [GridItem]
    @Namespace var namespace
    
    var body: some View{
        

        VStack{
            
            if self.columns.count == 2{
                
                VStack(spacing: 15){
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        Image(game.image)
                            .resizable()
                            .frame(height: 250)
                            .cornerRadius(15)
                        
                        Button {
                            
                        } label: {
                        
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all,10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all,10)

                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    
                    Text(game.name)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                    
                    Button {
                        
                    } label: {
                    
                        Text("Buy Now")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .padding(.horizontal,25)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .matchedGeometryEffect(id: "buy", in: self.namespace)

                }
            }
            else{
                
                // Row View....
                
                // adding animation...
                
                HStack(spacing: 15){
                    
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        
                        Image(game.image)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2,height: 250)
                            .cornerRadius(15)
                        
                        Button {
                            
                        } label: {
                        
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all,10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all,10)

                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(game.name)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: self.namespace)
                        
                        // Rating Bar...
                        
                        HStack(spacing: 10){
                            
                            ForEach(1...5,id: \.self){rating in
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(self.game.rating >= rating ? .yellow : .gray)
                            }
                            
                            Spacer(minLength: 0)
                        }
                        
                        Button {
                            
                        } label: {
                        
                            Text("Buy Now")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal,25)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding(.top,10)
                        .matchedGeometryEffect(id: "buy", in: self.namespace)
                    }
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
}

// sample Model Data...

struct Game : Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var rating : Int
}

var data = [

    Game(id: 0, name: "Resident Evil 3", image: "g2", rating: 3),
    Game(id: 1, name: "GTA 5", image: "g3", rating: 5),
    Game(id: 2, name: "Assaisan Creed Odesey", image: "g4", rating: 3),
    Game(id: 3, name: "Resident Evil 7", image: "g5", rating: 2),
    Game(id: 4, name: "Watch Dogs 2", image: "g6", rating: 1),
    Game(id: 5, name: "The Evil Within 2", image: "g7", rating: 2),
    Game(id: 6, name: "Tomb Raider 2014", image: "g8", rating: 4),
    Game(id: 7, name: "Shadow Of The Tomb Raider", image: "g1", rating: 4),

]

