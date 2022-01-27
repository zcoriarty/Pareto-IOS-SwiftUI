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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
             ContentView()
//            Conversation()
                .environmentObject(AppStateModel())
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

