//
//  NetworkClient.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

protocol NetworkClientProtocol: AnyObject {

    func get(url: URL,
             parameters: [String : String],
             headers: [HTTPHeaderField : String],
             completion: @escaping (Response) -> ())
    
    func post(url: URL,
              parameters: [String : String],
              headers: [HTTPHeaderField : String],
              completion: @escaping (Response) -> ())
}

final class NetworkClient: NetworkClientProtocol {

    func get(url: URL,
             parameters: [String : String],
             headers: [HTTPHeaderField : String],
             completion: @escaping (Response) -> ()) {

        self.performRequest(httpMethod: .get,
                            url: url,
                            parameters: parameters,
                            headers: headers,
                            completion: completion)
    }

    func post(url: URL,
              parameters: [String : String],
              headers: [HTTPHeaderField : String],
              completion: @escaping (Response) -> ()) {

        self.performRequest(httpMethod: .post,
                            url: url,
                            parameters: parameters,
                            headers: headers,
                            completion: completion)
    }

    func performRequest(httpMethod: HTTPMethod, url: URL, parameters: [String : String], headers: [HTTPHeaderField : String], completion: @escaping (Response) -> ()) {

        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }

        var request = URLRequest(url: components.url!)
        request.httpMethod = httpMethod.rawValue

        headers.forEach { headerField, value in

            request.setValue(value, forHTTPHeaderField: headerField.rawValue)
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {

                completion(.error(error))
                return
            }

            guard let data = data else {

                completion(.error(nil))
                return
            }

            completion(.result(data))
        }
        task.resume()
    }

}
