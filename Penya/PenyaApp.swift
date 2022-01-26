//
//  PenyaApp.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/21/22.
//

import SwiftUI
import Firebase

@main
struct PenyaApp: App {

    var body: some Scene {
        WindowGroup {
            // ContentView()
            Conversation()
                .environmentObject(AppStateModel())
        }
    }
}

