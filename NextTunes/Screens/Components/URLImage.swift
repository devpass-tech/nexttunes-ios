//
//  URLImage.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation
import SwiftUI

struct URLImage: View {

    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()

    init(url: String) {

        imageLoader = ImageLoader(urlString: url)
    }

    var body: some View {

        Image(uiImage: imageLoader.image ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}
