//
//  APIClient.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

protocol SpotifySearchAPIProtocol: HTTPClientProtocol {

    func fetchAlbums(term: String, completion: @escaping (SearchResponse?) -> ())
}

final class SpotifySearchAPI: SpotifySearchAPIProtocol {

    var baseURL: URL {

        return URL(string: "https://api.spotify.com/v1/search")!
    }

    var parameters: [String : String] = ["type" : "album"]

    var httpHeaders: [HTTPHeaderField : String] {

        return [HTTPHeaderField.contentType : ContentType.json.rawValue,
                HTTPHeaderField.authorization : AccessToken.accessToken]
    }

    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {

        self.networkClient = networkClient
    }

    func fetchAlbums(term: String, completion: @escaping (SearchResponse?) -> ()) {

        self.parameters["q"] = term

        self.networkClient.get(url: self.baseURL,
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

    private func decodeData(_ data: Data) -> SearchResponse? {

        let jsonDecoder = JSONDecoder()
        do {

            let response = try jsonDecoder.decode(SearchResponse.self, from: data)
            return response
        } catch {

            return nil
        }
    }
}

