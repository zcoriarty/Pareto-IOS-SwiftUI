//
//  SideMenu.swift
//  Pareto
//
//  Created by Zachary Coriarty on 1/23/22.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    @EnvironmentObject var model: AppStateModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 15) {
                
                Image("Pic") // Profile picture
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                Text("User's Name")
                    .font(.title2.bold())
                    .foregroundColor(Color("ContentWords"))
                
                Text("@usershandle")
                    .font(.callout)
                    .foregroundColor(Color("ContentWords"))
                
                
                HStack(spacing: 12){
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            Text("Followers")
                            .foregroundColor(Color("ContentWords"))
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                                .foregroundColor(Color("ContentWords"))
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        
                        Label {
                            Text("Following")
                            .foregroundColor(Color("ContentWords"))
                        } icon: {
                            Text("1.2M")
                                .fontWeight(.bold)
                                .foregroundColor(Color("ContentWords"))
                        }
                    }
                }
                .foregroundColor(.primary)
            }
            .padding()
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 10){
                    
                    // Tab Buttons...
                    VStack(alignment: .leading, spacing: 45) {
                        
                        TabButton(title: "Profile", image: "person.fill")
                    
                        TabButton(title: "Settings", image: "gearshape")
                        
                        TabButton(title: "About", image: "i.circle")
                        
                        TabButton(title: "Help", image: "questionmark.circle")
                        
                        TabButton(title: "Learn", image: "books.vertical")
                        
                        TabButton(title: "Contact Us", image: "bubble.left.and.exclamationmark.bubble.right")
                        
                    }
                    .padding(.horizontal)
                    .padding(.leading)
                    .padding(.top, 45)
                    
                    Divider()
                        .padding(.vertical)
                    
//                    TabButton(title: "Logout", image: "arrow.backward.square")
//                        .padding(.horizontal)
//                        .padding(.leading)
                    Button{
                        self.signOut()
                    } label: {
                        HStack(spacing: 14) {
                            Image(systemName: "arrow.backward.square")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                            
                            Text("Logout")
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        
                    }
                    .padding(.horizontal)
                    .padding(.leading)
                        
                    
                    Divider()
                        .padding(.vertical)
                }
            } // End ScrollView
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        // Max Width...
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
        
            Color("Primary")
                .opacity(0.80)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    
    
    @ViewBuilder
    func TabButton(title: String,image: String)->some View{
        
        // For navigation...
        // Simple replace button with Navigation Links...
        
        NavigationLink {
            
            Text("\(title) View")
                .navigationTitle(title)
            
        } label: {
         
            HStack(spacing: 14){
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        
        
        
    }
    
    func signOut() {
        model.signOut()
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showMenu: .constant(false))
    }
}

// Extenting View to get Screen Rect...
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func safeArea()->UIEdgeInsets{
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return null
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return null
        }
        
        return safeArea
    }
}
