//
//  ContentView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import SwiftUI

struct SplashView: View {

    @State private var authenticated = false
    
    let networkClient: NetworkClient

    var body: some View {

        if authenticated {
            AlbumListView(networkClient: self.networkClient)
                .transition(.opacity)

        } else {

            LoadingView()
                .onAppear(perform: {

                    let authAPI = SpotifyAuthAPI(networkClient: networkClient)

                    authAPI.authorize { response in

                        if let token = response?.accessToken {

                            AccessToken.accessToken = "Bearer \(token)"

                            withAnimation {
                                authenticated.toggle()
                            }
                        }
                    }
                })
        }

    }
}



struct SplashView_Previews: PreviewProvider {
    
    static var previews: some View {
        SplashView(networkClient: NetworkClient())
    }
}
