//
//  BasketWorker.swift
//  Chillax
//
//  Created by Nattanita on 18/8/2564 BE.
//

import Foundation

protocol IBasketWorker {
    func addMovieToCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void)
    func loadCart ( completion: @escaping (Result<[MovieDetails], Error>) -> Void)
    func clearMoviesInCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void)
    func checkOutMoviesInCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void)

}

struct BasketWorker {
    let basketStoreKey = "basketMovies"
    let checkOutStoreKey = "checkOutMovies"
}

extension BasketWorker: IBasketWorker {
    
    func addMovieToCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(movieDetails), forKey: basketStoreKey)
        completion(.success(true))
    }

    func loadCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void) {
        if let data = UserDefaults.standard.data(forKey: basketStoreKey)  {
            guard let movies = try? PropertyListDecoder().decode([MovieDetails].self, from: data) else{
                completion(.success([]))
                return
            }
            completion(.success(movies))
        }
        
        return
}
    
    func clearMoviesInCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void) {

        UserDefaults.standard.setValue(nil, forKey: basketStoreKey)
        completion(.success([]))
    }
    
    func checkOutMoviesInCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void){
        var checkOutMovies = loadCheckOutMovies()

        for movies in movieDetails{
            checkOutMovies.append(movies)
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(checkOutMovies), forKey: checkOutStoreKey)
        completion(.success(true))
    }
    
    func loadCheckOutMovies() -> [MovieDetails]{
            if let checkOutData = UserDefaults.standard.data(forKey: checkOutStoreKey)  {
                guard let checkOutMovies = try? PropertyListDecoder().decode([MovieDetails].self, from: checkOutData) else{
                    return []
                }
                return checkOutMovies
            }
        return []
    }
}


