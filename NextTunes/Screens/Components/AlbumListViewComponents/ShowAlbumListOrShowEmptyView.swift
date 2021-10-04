//
//  ShowAlbumListOrShowEmptyView.swift
//  NextTunes
//
//  Created by Diego Llopis on 03/10/21.
//

import SwiftUI

struct ShowAlbumListOrShowEmptyView: View {
    
    @EnvironmentObject var albumListViewModel: AlbumListViewModel
    
    @Binding var showingSearch: Bool
    
    var body: some View {
        
        if self.albumListViewModel.albums.isEmpty {
            EmptyView(action: {self.showingSearch = true})
        } else {
            AlbumList()
        }
    }
}
