//
//  SpotifyAuthAPIClient.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

protocol SpotifyAuthAPIProtocol: HTTPClientProtocol {

    func authorize(completion: @escaping (AuthorizationResponse?) -> ())
}

final class SpotifyAuthAPI: SpotifyAuthAPIProtocol {

    var baseURL: URL {

        return URL(string: "https://accounts.spotify.com/api/token")!
    }

    var parameters: [String : String] {

        return ["grant_type" : "client_credentials"]
    }

    var httpHeaders: [HTTPHeaderField : String] {

        return [
            .authorization : "Basic <Base64 encoded client:secret>",
            .contentType : "application/x-www-form-urlencoded"]
    }

    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {

        self.networkClient = networkClient
    }

    func authorize(completion: @escaping (AuthorizationResponse?) -> ()) {

        self.networkClient.post(url: self.baseURL,
                                parameters: self.parameters,
                                headers: self.httpHeaders) { response in

            DispatchQueue.main.async {

                switch response {

                case .result(let data):

                    completion(self.decodeData(data))
                case .error:

                    completion(nil)
                }
            }
        }
    }

    private func decodeData(_ data: Data) -> AuthorizationResponse? {

        let jsonDecoder = JSONDecoder()
        do {

            let response = try jsonDecoder.decode(AuthorizationResponse.self, from: data)
            return response
        } catch {

            return nil
        }
    }
}


