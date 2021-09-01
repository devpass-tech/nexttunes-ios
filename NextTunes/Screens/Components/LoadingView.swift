//
//  LoadingView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 01/09/21.
//

import Foundation
import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack {
            Image("app_logo")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Welcome to NextTunes!")
                .padding()
                .font(.title.weight(.semibold))
            ProgressView()
        }
    }
}
