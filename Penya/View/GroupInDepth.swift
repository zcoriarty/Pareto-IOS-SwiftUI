//
//  GroupInDepth.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

struct GroupInDepth: View {
    
    
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        VStack(spacing: 15){
        // Header..
        HStack(spacing: 15){
            
            
            // TODO: Group name here
            Text("Group Name")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Follow")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ContentWords"))
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("CellGray"))
                    )
            }

        }
        .padding(.horizontal)
        .foregroundColor(Color("ContentWords"))
        
        ScrollView(.vertical, showsIndicators: false) {
            
                
                // Download Stats....
                DownloadStats()
                
                // Followers Stats...
                KeyMetrics()
                
                // Payment View..
                
            }
            .padding(15)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundGray").ignoresSafeArea())
//        .preferredColorScheme(.dark)
        
        
    }
    
    
    
    @ViewBuilder
    func KeyMetrics()->some View{
        
        LazyVGrid(columns: self.columns, spacing: 12) {
            ForEach(keyMetricsData) {metrics in
                
                StatView(metrics: metrics, columns: self.$columns)
            }
        }
        .padding(.top)
        
        
    }
    
    
    
    @ViewBuilder
    func DownloadStats()->some View{
        
        VStack(spacing: 15){
            
            HStack{
                
                VStack(alignment: .leading, spacing: 13) {
                    
                    // TODO: Get group name
                    Text("$Current Profit$")
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
            
            
            // Switch between bar and line graph
//            // Bar Graph With Gestures...
//            BarGraph(downloads: weekDownloads)
//                .padding(.top,25)
            LineGraph(data: samplePlot)
            // Max Size..
                .frame(height: 220)
                .padding(.top,25)
        }
        .padding(15)
        .background(
        
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("CellGray"))
        )
        .padding(.vertical,20)
    }
}

struct StatView : View {
    
    var metrics : Metrics
    
    @Binding var columns : [GridItem]
    
    var body: some View {
    
    VStack(alignment: .leading, spacing: 25) {
        
        HStack{
            Image(systemName: metrics.image)
                .font(.caption.bold())
                .foregroundColor(Color(metrics.color))
                .padding(6)
                .background(Color("ContentWords"))
                .cornerRadius(8)
            
            Text(metrics.id)
        }
        
        Text(metrics.content)
            .font(.title.bold())
    }
    .foregroundColor(Color("ContentWords"))
    .padding(.vertical,22)
    .padding(.horizontal,18)
    .frame(maxWidth: .infinity,alignment: .leading)
    .background(Color("Primary")).opacity(0.90) //TODO: make the blue brighter
    .cornerRadius(15)
}
}

struct Metrics : Identifiable {
    
    var id : String
    var content : String
    var image : String
    var color : String
}


// TODO: get live key metrics here
var keyMetricsData = [

    Metrics(id: "Followers", content: "87.57K", image: "checkmark", color: "Primary"),
    
    Metrics(id: "Profit Days", content: "22", image: "number", color: "Primary"),
    
    Metrics(id: "Total Profit", content: "$1,800", image: "chart.line.uptrend.xyaxis", color: "Primary"),
    
    Metrics(id: "Founder", content: "@nattyb", image: "person", color: "Primary"),
    
    Metrics(id: "1Y Target", content: "$5000", image: "scope", color: "Primary"),
    
    Metrics(id: "Sentiment", content: ".92", image: "newspaper", color: "Primary"),
    
]

// TODO: get live line graph data here
let samplePlot: [CGFloat] = [

    989,1200,750,790,650,950,1200,600,500,600,890,1203,1400,900,1250,
1600,1200
]



struct GroupInDepth_Previews: PreviewProvider {
    static var previews: some View {
        GroupInDepth()
            .preferredColorScheme(.dark)
    }
}
