//
//  AlbumListView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import SwiftUI

struct AlbumListView: View {
    
    let networkClient: NetworkClient
    
    @StateObject var albumListViewModel = AlbumListViewModel()
    @State private var showingSearch = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(albumListViewModel.albums) { album in
                    AlbumItemView(album: album)
                }
                .onDelete(perform: albumListViewModel.deleteAlbum)
                .onMove(perform: albumListViewModel.moveAlbum)
            }
            
            .toolbar {
                
                HStack {
                    
                    EditButton()
                    
                    Button("Search") {
                        
                        showingSearch = true
                    }
                    .sheet(isPresented: $showingSearch,
                           onDismiss: {
                            
                            if let selectedAlbum = albumListViewModel.selectedAlbum {
                                
                                albumListViewModel.albums.append(selectedAlbum)
                                albumListViewModel.selectedAlbum = nil
                            }
                           }) {
                        
                        AlbumSearchView(showModal: $showingSearch, onAlbumSelected: { album in
                            
                            albumListViewModel.selectedAlbum = album
                        })
                }
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
