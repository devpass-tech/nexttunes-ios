//
//  AlbumListView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import SwiftUI

struct AlbumListView: View {
    
    let networkClient: NetworkClient
    let navigationTitle: String = "Next Tunes"
    
    @State private var editMode = EditMode.inactive
    @State private var showingSearch = false
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                ShowAlbumListOrShowEmptyView(showingSearch: $showingSearch)
            }
            .environment(\.editMode, self.$editMode)
            .animation(.spring(response: 0))
            .navigationTitle(self.navigationTitle)
            .navigationBarItems(
                trailing:
                    HStack {
                        EditButton(editMode: self.$editMode)
                        SearchButton(showingSearch: $showingSearch)
                    })
        }
        .environmentObject(self.albumListViewModel)
    }
}

struct AlbumListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AlbumListView(networkClient: NetworkClient())
    }
}
