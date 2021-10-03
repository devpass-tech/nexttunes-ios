//
//  AlbumList.swift
//  NextTunes
//
//  Created by Diego Llopis on 02/10/21.
//

import SwiftUI

struct AlbumList: View {
    
    @EnvironmentObject var albumListViewModel: AlbumListViewModel

    var body: some View {
        
        List {
            ForEach(albumListViewModel.albums) { album in
                Button {
                    openAlbumOnSpotify(album)
                } label: {
                    AlbumItemView(album: album)
                }
            }
            .onDelete(perform: albumListViewModel.deleteAlbum)
            .onMove(perform: albumListViewModel.moveAlbum)
        }
        .listStyle(PlainListStyle())
    }
    
    func openAlbumOnSpotify(_ album: Album) {
        if let url = URL(string: album.externalUrl.spotify) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList()
    }
}
