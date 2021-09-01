//
//  HTTPClient.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

protocol HTTPClientProtocol: AnyObject {

    var baseURL: URL { get }
    var parameters: [String : String] { get }
    var httpHeaders: [HTTPHeaderField : String] { get }
    var networkClient: NetworkClientProtocol { get }
}


