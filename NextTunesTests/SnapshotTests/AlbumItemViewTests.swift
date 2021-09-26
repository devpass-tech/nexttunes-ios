//
//  AlbumItemViewTests.swift
//  NextTunesTests
//
//  Created by Rodrigo Borges on 29/08/21.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import NextTunes

class AlbumItemViewTests: XCTestCase {
		
	func testSnapshotAlbumItemView() {
		let listArtist = makeArtist()
		let listAlbumImage = makeAlbumImage()
		let album = Album(id: "4s3DJODPpSqMtiC5rARb0Y",
								artists: listArtist,
								images: listAlbumImage,
								name: "Mais",
								releaseDate: "2013-05-27")
		let albumItemView = AlbumItemView(album: album)

		let view: UIView = UIHostingController(rootView: albumItemView).view
		
		assertSnapshot(matching: view, as: .image(size: view.intrinsicContentSize), record: false)
	}

}

extension AlbumItemViewTests {
	
	func makeArtist() -> [Artist] {
		var arrayArtist = [Artist]()
		
		arrayArtist.append(Artist(id: "1Ja8qReIBoi7Z6ik0AQ6zS", name: "Os Arrais"))
		
		return arrayArtist
	}
	
	func makeAlbumImage() -> [AlbumImage] {
		var arrayAlbumImage = [AlbumImage]()
		
		arrayAlbumImage.append(AlbumImage(
			width: 640,
			height: 640,
			url: "https://i.scdn.co/image/ab67616d0000b27346503799ad7e2cec15c686d9"
		))
		
		return arrayAlbumImage
	}
	
}
