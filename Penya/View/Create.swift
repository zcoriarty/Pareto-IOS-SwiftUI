//
//  Create.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/24/22.
//

import SwiftUI

struct Create: View {
    
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
            Text("Penya")
                .font(.system(size: 25.0))
                .foregroundColor(Color("Primary"))
            }
        }
    }
}

struct Create_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




////
////  GroupInDepth.swift
////  Penya
////
////  Created by Zachary Coriarty on 1/25/22.
////
//
//import SwiftUI
//
//struct GroupInDepth: View {
//    var body: some View {
//        VStack(spacing: 15){
//        // Header..
//        HStack(spacing: 15){
//            Button {
//
//            } label: {
//
//                Image(systemName: "arrow.left")
//                    .font(.title2)
//
//            }
//
//            // TODO: Group name here
//            Text("Group Name")
//                .font(.title2)
//                .fontWeight(.bold)
//
//            Spacer()
//
//            Button {
//
//            } label: {
//                Text("Follow")
//                    .font(.callout)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("ContentWords"))
//                    .padding(.vertical,10)
//                    .padding(.horizontal)
//                    .background(
//
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color("CellGray"))
//                    )
//            }
//
//        }
//        .padding(.horizontal)
//        .foregroundColor(Color("ContentWords"))
//
//        ScrollView(.vertical, showsIndicators: false) {
//
//
//
//
//
//                // Download Stats....
//                DownloadStats()
//
//                // Followers Stats...
//                KeyMetrics()
//
//                // Payment View..
//
//            }
//            .padding(15)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("BackgroundGray").ignoresSafeArea())
////        .preferredColorScheme(.dark)
//    }
//
//    @ViewBuilder
//    func KeyMetrics()->some View{
//
//        VStack{
//
//            // Following Followers Stats...
//
//            HStack(spacing: 10){
//
//                StatView(title: "Followers", count: "87.57K", image: "checkmark", color: "Primary")
//
//                StatView(title: "Weeks on App", count: "27.57K", image: "play.fill", color: "Primary")
//                StatView(title: "Total Profit", count: "27.57K", image: "play.fill", color: "Primary")
//                StatView(title: "Founder", count: "27.57K", image: "play.fill", color: "Primary")
//
//                StatView(title: "Co-Founder", count: "27.57K", image: "play.fill", color: "Primary")
//            }
//            .padding(.top)
//        }
//        .frame(maxWidth: .infinity)
//        .padding(15)
//        .background(
//
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color("CellGray"))
//        )
//    }
//
//    @ViewBuilder
//    func StatView(title: String,count: String,image: String,color: String)->some View{
//
//        VStack(alignment: .leading, spacing: 25) {
//
//            HStack{
//                Image(systemName: image)
//                    .font(.caption.bold())
//                    .foregroundColor(Color(color))
//                    .padding(6)
//                    .background(Color("ContentWords"))
//                    .cornerRadius(8)
//
//                Text("Followers")
//            }
//
//            Text(count)
//                .font(.title.bold())
//        }
//        .foregroundColor(Color("ContentWords"))
//        .padding(.vertical,22)
//        .padding(.horizontal,18)
//        .frame(maxWidth: .infinity,alignment: .leading)
//        .background(Color(color)).opacity(0.70)
//        .cornerRadius(15)
//    }
//
//    @ViewBuilder
//    func DownloadStats()->some View{
//
//        VStack(spacing: 15){
//
//            HStack{
//
//                VStack(alignment: .leading, spacing: 13) {
//
//                    // TODO: Get group name
//                    Text("$Current Profit$")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color("ContentWords"))
//
//                    Menu {
//
//                    } label: {
//
//                        Label {
//                            Image(systemName: "chevron.down")
//                        } icon: {
//                            Text("Last 7 Days")
//                        }
//                        .font(.callout)
//                        .foregroundColor(.gray)
//
//                    }
//
//                }
//
//                Spacer()
//
//                Button {
//
//                } label: {
//                    Image(systemName: "arrow.up.forward")
//                        .font(.title2.bold())
//                }
//                .foregroundColor(.white)
//                .offset(y: -10)
//
//            }
//
//
//
//            // Bar Graph With Gestures...
//            BarGraph(downloads: weekDownloads)
//                .padding(.top,25)
//        }
//        .padding(15)
//        .background(
//
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color("CellGray"))
//        )
//        .padding(.vertical,20)
//    }
//}
//
//struct GroupInDepth_Previews: PreviewProvider {
//    static var previews: some View {
//        GroupInDepth()
//    }
//}
