//
//  BasketWorker.swift
//  Chillax
//
//  Created by Nattanita on 18/8/2564 BE.
//

import Foundation

protocol IBasketWorker {
//    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void)
    func addMovieToCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void)
    func  loadCart ( completion: @escaping (Result<[MovieDetails], Error>) -> Void)
    func  clearMoviesInCart( completion: @escaping (Result<[MovieDetails], Error>) -> Void)
    func checkOutMoviesInCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void)

}

struct BasketWorker {
//    let remoteStore: DetailRemoteStore
    let basketStoreKey = "basketMovies"
    let checkOutStoreKey = "checkOutMovies"
//    var movies : [MovieDetails]
}

// MARK: - IHomeWorker
extension BasketWorker: IBasketWorker {
    
    func addMovieToCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void){
//        var moviesInCart = loadCart(completion: (Result<[MovieDetails], Error>) -> Void)
//        print(movieDetails)
//        print(moviesInCart)

        UserDefaults.standard.set(try? PropertyListEncoder().encode(movieDetails), forKey: basketStoreKey)
//        UserDefaults.standard.setValue(movieDetails, forKey: basketStoreKey)
        completion(.success(true))


    }
//
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
        completion(.success([]))
//        return

//        print(UserDefaults.standard.data(forKey: "basketStoreKey"))

    }
    
    func checkOutMoviesInCart (movieDetails: [MovieDetails], completion: @escaping (Result<Bool, Error>) -> Void){
        var checkOutMovies = loadCheckOutMovies()

        for movies in movieDetails{
            checkOutMovies.append(movies)
        }
//        print(checkOutMovies)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(checkOutMovies), forKey: checkOutStoreKey)
//        UserDefaults.standard.setValue(moviesInCart, forKey: basketStoreKey)
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


