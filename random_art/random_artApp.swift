//
//  random_artApp.swift
//  random_art
//
//  Created by user on 12.06.2024.
//

import SwiftUI
import SwiftData

@main
struct random_artApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack(){
                ContentView()
            }
        }
        .modelContainer(for: [ArtLink.self])
    }
}
