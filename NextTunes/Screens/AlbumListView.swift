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
    
    @State private var editMode = EditMode.inactive
    @State private var showingSearch = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                if albumListViewModel.albums.isEmpty {
                    EmptyView(action: {
                        self.showingSearch = true
                    })
                } else {
                    List {
                        ForEach(albumListViewModel.albums) { album in
                            AlbumItemView(album: album)
                        }
                        .onDelete(perform: albumListViewModel.deleteAlbum)
                        .onMove(perform: albumListViewModel.moveAlbum)
                    }
                }
            }
            .environment(\.editMode, $editMode)
            .animation(.spring(response: 0))
            .listStyle(PlainListStyle())
            .navigationTitle("Next Tunes")
            .navigationBarItems(
                trailing:
                    
                    HStack {
                        
                        EditButton(editMode: $editMode)
                        
                        Button("Search") {
                            editMode = EditMode.inactive
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
                    })
        }
    }
}

struct AlbumListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AlbumListView(networkClient: NetworkClient())
    }
}
