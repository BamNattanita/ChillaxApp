//
//  SearchMovieRemoteStore.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

enum SearchRemoteStoreErrors: Error {
    case noResult
}

protocol ISearchRemoteStore {
    func search(title: String, completion: @escaping (Result<SearchResultResponse?, Error>) -> Void)
}

class SearchRemoteStore: ISearchRemoteStore {
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
    
    func search(title: String, completion: @escaping (Result<SearchResultResponse?, Error>) -> Void) {
        guard let urlComponents = URLComponents(string: "\(baseUrl)/search/movie?api_key=\(apiKey)&query=\(title)") else {
            completion(.failure(SearchRemoteStoreErrors.noResult))
            return
        }

        guard let url = urlComponents.url else {
            completion(.failure(SearchRemoteStoreErrors.noResult))
            return
        }

        urlSession.dataTask(with: url) { [unowned self] (data, response, error) in

            if error != nil {
                completion(.failure(SearchRemoteStoreErrors.noResult))
                return
            }
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(.failure(SearchRemoteStoreErrors.noResult))
                return
            }
            guard let data = data else {
                completion(.failure(SearchRemoteStoreErrors.noResult))
                return
            }
            do {
                let resultResponse = try self.jsonDecoder.decode(SearchResultResponse.self, from: data)
                completion(.success(resultResponse))
            } catch {
                completion(.failure(SearchRemoteStoreErrors.noResult))
                return
            }
        }.resume()
    }
}
