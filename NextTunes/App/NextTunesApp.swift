//
//  NextTunesApp.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import SwiftUI

@main
struct NextTunesApp: App {

    let networkClient = NetworkClient()

    var body: some Scene {
        WindowGroup {
            SplashView(networkClient: self.networkClient)
        }
    }
}
