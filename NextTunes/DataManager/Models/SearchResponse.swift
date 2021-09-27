//
//  SearchResponse.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

struct SearchResponse: Codable {

    var albums: Albums
}

struct Albums: Codable {

    var href: String
    var items: [Album]
    var limit: Int
    var offset: Int
    var total: Int
}

struct Album: Codable, Identifiable {

    var id: String
    var artists: [Artist]
    var images: [AlbumImage]
    var name: String
    var releaseDate: String
    var externalUrl: ExternalUrl

    enum CodingKeys: String, CodingKey {

        case releaseDate = "release_date"
        case externalUrl = "external_urls"

        case id
        case name
        case artists
        case images
    }
}

struct ExternalUrl: Codable {
    
    var spotify: String
}

struct AlbumImage: Codable {

    var width: Int
    var height: Int
    var url: String
}

struct Artist: Codable {

    var id: String
    var name: String
}


