//
//  HomeRemoteStore.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.

import Foundation

enum RemoteStoreError: Error {
    case noResult
}
protocol IHomeRemoteStore {
    func movies(completion: @escaping (Result<[Movie]?, Error>) -> Void)
}

class HomeRemoteStore: IHomeRemoteStore {
    
    private let apiKey = "2b1f7cd2255bdc2ecbee5920521bb794"
    private let baseUrl = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func movies(completion: @escaping (Result<[Movie]?, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(baseUrl)/movie/upcoming") else {
            completion(.failure(RemoteStoreError.noResult))
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            completion(.failure(RemoteStoreError.noResult))
            return
        }

        urlSession.dataTask(with: url) { [unowned self] (data, response, error) in

            if error != nil {
                completion(.failure(RemoteStoreError.noResult))
                return
            }
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.failure(RemoteStoreError.noResult))
                return
            }
            guard let data = data else {
                completion(.failure(RemoteStoreError.noResult))
                return
            }
            do {
                let movieResponse = try self.jsonDecoder.decode(MoviesResponse.self, from: data)
                completion(.success(movieResponse.results))
            } catch {
                completion(.failure(RemoteStoreError.noResult))
                return
            }
        }.resume()
    }
}
