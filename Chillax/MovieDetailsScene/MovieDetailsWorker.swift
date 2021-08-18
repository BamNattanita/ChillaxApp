//
//  MovieDetailsWorker.swift
//  Chillax
//
//  Created by Nattanita on 11/8/2564 BE.
//

import Foundation

protocol IDetailWorker {
    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void)
    func addToCart (movieDetails: MovieDetails, completion: @escaping (Result<Bool, Error>) -> Void)
}

struct DetailWorker {
    let remoteStore: DetailRemoteStore
    let basketStoreKey = "basketMovies"
}

// MARK: - IHomeWorker
extension DetailWorker: IDetailWorker {
    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void) {
        remoteStore.details(id: id, completion: completion)
    }
    
    
    func addToCart (movieDetails: MovieDetails, completion: @escaping (Result<Bool, Error>) -> Void){
        var moviesInCart = loadCart()
        print(moviesInCart.count)
        moviesInCart.append(movieDetails)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(moviesInCart), forKey: basketStoreKey)
//        UserDefaults.standard.setValue(moviesInCart, forKey: basketStoreKey)
        completion(.success(true))

        
    }
    
    func loadCart() -> [MovieDetails]{
            if let data = UserDefaults.standard.data(forKey: basketStoreKey)  {
                guard let movies = try? PropertyListDecoder().decode([MovieDetails].self, from: data) else{
                    return []
                }
                return movies
//                let decoder = JSONDecoder()
//                guard let movies = try? decoder.decode([MovieDetails].self, from: data) else {
//                    return []
//                }
//                return movies
            }
        return []
    }
}


