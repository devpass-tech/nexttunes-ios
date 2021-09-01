//
//  AlbumItemView.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 31/08/21.
//

import SwiftUI

struct AlbumItemView: View {

    private let album: Album

    init(album: Album) {
        
        self.album = album
    }

    var body: some View {

        HStack {
            URLImage(url: album.images.first?.url ?? "")

            VStack(alignment: .leading, spacing: 4) {
                Text(album.name)
                    .font(.title2.bold())
                Text(album.artists.first?.name ?? "")
                    .font(.subheadline)
                Text("Release date: \(album.releaseDate)")
                    .font(.subheadline)

            }
        }

    }
}


struct AlbumItemView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumItemView(album:
                        Album(id: "",
                              artists: [Artist(id: "", name: "Artist name")],
                              images: [], name: "Album name",
                              releaseDate: ""))
    }
}
