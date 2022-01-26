//
//  Download.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

// Sample Graph Model and Data....
struct Download: Identifiable{
    var id = UUID().uuidString
    var downloads: CGFloat
    var day: String
    var color: Color
}


// TODO: get and store data for a group
// profitable days get "GreenBar"...
var weekDownloads: [Download] = [

    Download(downloads: 30, day: "S", color: Color("RedBar")),
    Download(downloads: 45, day: "M", color: Color("RedBar")),
    Download(downloads: 60, day: "T", color: Color("GreenBar")),
    Download(downloads: 90, day: "W", color: Color("GreenBar")),
    Download(downloads: 40, day: "T", color: Color("RedBar")),
    Download(downloads: 50, day: "F", color: Color("GreenBar")),
    Download(downloads: 20, day: "S", color: Color("RedBar")),
]
