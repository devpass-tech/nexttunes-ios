//
//  AuthorizationResponse.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

struct AuthorizationResponse: Codable {

    var accessToken: String
    var tokenType: String
    var expiresIn: Int

    enum CodingKeys: String, CodingKey {
        
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}
