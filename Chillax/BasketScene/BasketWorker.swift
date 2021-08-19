//
//  BasketWorker.swift
//  Chillax
//
//  Created by Nattanita on 18/8/2564 BE.
//

import Foundation

protocol IBasketWorker {
//    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void)
    func  loadCart ( completion: @escaping (Result<[MovieDetails], Error>) -> Void)
    func  clearMoviesInCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void)
}

struct BasketWorker {
//    let remoteStore: DetailRemoteStore
    let basketStoreKey = "basketMovies"
}

// MARK: - IHomeWorker
extension BasketWorker: IBasketWorker {
    func loadCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void) {
        if let data = UserDefaults.standard.data(forKey: basketStoreKey)  {
            guard let movies = try? PropertyListDecoder().decode([MovieDetails].self, from: data) else{
                completion(.success([]))
                return
            }
            completion(.success(movies))
            
//                let decoder = JSONDecoder()
//                guard let movies = try? decoder.decode([MovieDetails].self, from: data) else {
//                    return []
//                }
//                return movies
            
        }
//        completion(.failure(Error]))
        return
}
    
    
    
    func clearMoviesInCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void) {

        UserDefaults.standard.setValue(nil, forKey: basketStoreKey)
        return

//        print(UserDefaults.standard.data(forKey: "basketStoreKey"))

    }
}


