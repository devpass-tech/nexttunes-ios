//
//  SearchButton.swift
//  NextTunes
//
//  Created by Diego Llopis on 03/10/21.
//

import SwiftUI

struct SearchButton: View {
    
    @EnvironmentObject var albumListViewModel: AlbumListViewModel
    
    @Binding var showingSearch: Bool
        
    var body: some View {
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

//struct SearchButton_Previews: PreviewProvider {
//    static var previews: some View {
//
//        SearchButton()
//    }
//}
