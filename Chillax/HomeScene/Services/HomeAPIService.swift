//
//  HomeAPIService.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.

import Foundation

protocol IHomeAPIService {
    func movies(
        completion: @escaping (Result<[Movie]?, Error>) -> Void
    )
}

class MovieService {
    
    var movieStore: IHomeAPIService
    
    init(movieStore: IHomeAPIService) {
        self.movieStore = movieStore
    }
    
    func movies(
        completion: @escaping (Result<[Movie]?, Error>) -> Void
    ) {
        movieStore.movies(completion: completion)
    }
}
