//
//  BaseView.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/21/22.
//

import SwiftUI

struct BaseView: View {
    // Menu Option...
    @State var showMenu: Bool = false

    
    // Hiding Tab bar
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Home"

    // Offset for Both Drag Gesuture and showing Menu...
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    // GEsture Offset...
    @GestureState var gestureOffset: CGFloat = 0
    
    // Matched Geomtery effect..
    @Namespace var animation
    
    // Current Tab XValue...
    @State var currentXValue: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        NavigationView {
            
            HStack(spacing: 0){
                // Side Menu
                SideMenu(showMenu: $showMenu)
                
                // Main Tab View
                VStack(spacing: 0) {
                    
                    TabView(selection: $currentTab) {
                        
                        Home(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house.fill")
                        Explore(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("magnifyingglass")
//                        Chat(showMenu: $showMenu)
//                            .navigationBarTitleDisplayMode(.inline)
//                            .navigationBarHidden(true)
//                            .tag("bubble.left.and.bubble.right.fill")
                        
                        
                    }
                    .frame(width: getRect().width)
//                     Curved Tab Bar...
                    .overlay(

                        HStack(spacing: 0){

                            ForEach(BottomTab.allCases,id: \.rawValue){tab in

                                TabButton(image: tab.rawValue)
                            }

                        }
                        .padding(.vertical)
                        // Preview wont show safeArea...
                        .padding(.bottom,getSafeArea().bottom == 0 ? 10 : (getSafeArea().bottom - 10))
                        .background(

                            MaterialEffect(style: .systemUltraThinMaterialDark)
                                .clipShape(CustomCurveShape(currentXValue: currentXValue))
                        )

                        ,alignment: .bottom
                    )
                    .ignoresSafeArea(.all, edges: .bottom)
                    // Always Dark...
//                    .preferredColorScheme(.dark)

            }

        }
                    
              
        // max Size...
        .frame(width: getRect().width + sideBarWidth)
        .offset(x: -sideBarWidth / 2)
        .offset(x: offset > 0 ? offset : 0)
        // Gesture...
        .gesture(
        
            DragGesture()
                .updating($gestureOffset, body: { value, out, _ in
                    out = value.translation.width
                })
                .onEnded(onEnd(value:))
        )
        // No Nav bar title...
        // Hiding nav bar...
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
            
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            
            // Preview issues...
            
            if showMenu && offset == 0{
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sideBarWidth{
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()

        
    }
}
    
    func onChange(){
        let sideBarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? ((gestureOffset + lastStoredOffset) < sideBarWidth ? (gestureOffset + lastStoredOffset) : offset) : offset
        
        offset = (gestureOffset + lastStoredOffset) > 0 ? offset : 0
    }
    
    func onEnd(value: DragGesture.Value){
        
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            // Checking...
            if translation > 0{
                
                if translation > (sideBarWidth / 2){
                    // showing menu...
                    offset = sideBarWidth
                    showMenu = true
                }
                else{
                    
                    // Extra cases...
                    if offset == sideBarWidth || showMenu{
                        return
                    }
                    offset = 0
                    showMenu = false
                }
            }
            else{
                
                if -translation > (sideBarWidth / 2){
                    offset = 0
                    showMenu = false
                }
                else{
                    
                    if offset == 0 || !showMenu{
                        return
                    }
                    
                    offset = sideBarWidth
                    showMenu = true
                }
            }
        }
        
        // storing last offset...
        lastStoredOffset = offset
    }
    
    // TabButton...
    @ViewBuilder
    func TabButton(image: String) -> some View{
        
        // Since we need XAxis Value for Curve...
        GeometryReader{proxy in
            
            Button {
                
                withAnimation(.spring()){
                    currentTab = image
                    // updating Value...
                    currentXValue = proxy.frame(in: .global).midX
                }
                
            } label: {
                
                // Moving Button up for current Tab...
                
                Image(systemName: image)
                // Since we need perfect value for Curve...
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("Primary"))
                    .padding(currentTab == image ? 15 : 0)
                    .background(
                    
                        ZStack{

                            if currentTab == image{

                                MaterialEffect(style: .extraLight)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    )
                    .contentShape(Rectangle())
                    .offset(y: currentTab == image ? -50 : 0)
            }
            // Setting intial Curve Position...
            .onAppear {
                
                if image == BottomTab.HomeT.rawValue && currentXValue == 0{
                    currentTab = "home.fill"
                    currentXValue = proxy.frame(in: .global).midX
                }
            }
        }
        .frame(height: 25)
        // MaxSize...
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.portrait)
    }
}

            
// Extending View to get Safe Area Values...
extension View{
    
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}
