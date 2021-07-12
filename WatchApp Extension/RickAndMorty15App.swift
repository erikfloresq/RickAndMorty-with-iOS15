//
//  RickAndMorty15App.swift
//  WatchApp Extension
//
//  Created by Erik Flores on 12/7/21.
//

import SwiftUI

@main
struct RickAndMorty15App: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
