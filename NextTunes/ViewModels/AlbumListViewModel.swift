//
//  AlbumListViewModel.swift
//  NextTunes
//
//  Created by Diego Llopis on 15/09/21.
//

import SwiftUI

class AlbumListViewModel: ObservableObject {
    
    let albumsKey = "albums_list"
    
    @Published var albums: [Album] = []{
        didSet {
            self.saveAlbums()
        }
    }
    
    @Published var selectedAlbum: Album?
    
    init() {
        getAlbums()
    }
    
    func getAlbums() {
        guard
            let data = UserDefaults.standard.data(forKey: albumsKey),
            let decodedData = try? JSONDecoder().decode([Album].self, from: data)
        else { return }
        
        self.albums = decodedData
    }
    
    func deleteAlbum(indexSet: IndexSet) {
        self.albums.remove(atOffsets: indexSet)
    }
    
    func moveAlbum(from: IndexSet, to: Int) {
        self.albums.move(fromOffsets: from, toOffset: to)
    }
    
    func saveAlbums() {
        if let encodedData = try? JSONEncoder().encode(self.albums) {
            UserDefaults.standard.set(encodedData, forKey: albumsKey)
        }
        
    }
}
