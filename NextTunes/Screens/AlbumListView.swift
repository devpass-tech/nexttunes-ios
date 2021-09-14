//
//  AlbumListView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import SwiftUI

struct AlbumListView: View {

    @State private var albums: [Album] = []
    @State private var showingSearch = false
    @State private var selectedAlbum: Album?

    let networkClient: NetworkClient
    
    var body: some View {
        
        NavigationView {
            List(albums) { album in

                AlbumItemView(album: album)
            }
            .toolbar {

                Button("Search") {

                    showingSearch = true
                }
                .sheet(isPresented: $showingSearch,
                       onDismiss: {

                    if let selectedAlbum = selectedAlbum {

                        albums.append(selectedAlbum)
                        self.selectedAlbum = nil
                    }
                }) {

                    AlbumSearchView(showModal: $showingSearch, onAlbumSelected: { album in

                        selectedAlbum = album
                    })
                }
            }
            .navigationTitle("Next Tunes")
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {

    static var previews: some View {
        AlbumListView(networkClient: NetworkClient())
    }
}
