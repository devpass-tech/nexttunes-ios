//
//  AlbumListView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import SwiftUI

struct AlbumListView: View {
    
    let networkClient: NetworkClient
    
    @StateObject var albumListVM = AlbumListViewModel()
    @State private var showingSearch = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                if albumListVM.albums.isEmpty {
                    EmptyView(action: {
                        self.showingSearch = true
                    })
                } else {
                    List {
                        ForEach(albumListVM.albums) { album in
                            AlbumItemView(album: album)
                        }
                        .onDelete(perform: albumListVM.deleteAlbum)
                        .onMove(perform: albumListVM.moveAlbum)
                    }
                }
            }
            .navigationTitle("Next Tunes")
            .listStyle(PlainListStyle())
            .navigationBarItems(
                trailing:
                    HStack {
                        EditButton()
                        
                        Button("Search") {
                            showingSearch = true
                        }
                        .sheet(isPresented: $showingSearch,
                               onDismiss: {
                                
                                if let selectedAlbum = albumListVM.selectedAlbum {
                                    
                                    albumListVM.albums.append(selectedAlbum)
                                    albumListVM.selectedAlbum = nil
                                }
                               }) {
                            AlbumSearchView(showModal: $showingSearch, onAlbumSelected: { album in
                                
                                albumListVM.selectedAlbum = album
                            })
                        }
                    })
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AlbumListView(networkClient: NetworkClient())
    }
}
