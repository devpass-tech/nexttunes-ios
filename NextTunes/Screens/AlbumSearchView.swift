//
//  SearchView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 31/08/21.
//

import Foundation
import SwiftUI
import SwiftUIX

struct AlbumSearchView: View {

    @State private var searchText = ""
    @State private var isEditing = true
    @State private var isSearching = false
    @State private var searchResults: [Album] = []

    @Environment(\.presentationMode) var presentationMode

    @Binding var showModal: Bool

    let onAlbumSelected: (Album) -> ()


    var body: some View {

        NavigationView {

            if isSearching {

                ProgressView()
            } else {

					List(searchResults) { album in
						
						Button(action: {
							showModal = false
							onAlbumSelected(album)
						}) {
							AlbumItemView(album: album)
						}
						
					}
                .navigationTitle("Search albums")
                .navigationBarItems(leading: Button("Close") {

                    showModal = false
                })
                .navigationSearchBar {
                    SearchBar("Artist or album",
                              text: $searchText,
                              isEditing: $isEditing) {

                        isSearching = true

                        let networkClient = NetworkClient()
                        let searchAPI = SpotifySearchAPI(networkClient: networkClient)
                        searchAPI.fetchAlbums(term: searchText) { response in

                            if let response = response {

                                self.searchResults = response.albums.items
                            }

                            isSearching = false
                        }

                    }
                    .onCancel {

                    }
                    .searchBarStyle(.default)
                }
            }

        }
    }
}

struct AlbumSearchView_Previews: PreviewProvider {

    @State private static var showModal = true

    static var previews: some View {
        AlbumSearchView(showModal: $showModal, onAlbumSelected: { _ in })
    }
}

