//
//  MovieDetailAPIService.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

protocol ISearchMovieAPIService {
    func search(
        completion: @escaping (Result<SearchMovie?, Error>) -> Void
    )
}


class SearchMovieService {
    
    var searchStore: ISearchMovieAPIService
    
    init(searchStore: ISearchMovieAPIService) {
        self.searchStore = searchStore
    }
    
    func search(
        completion: @escaping (Result<SearchMovie?, Error>) -> Void

    ) {
        searchStore.search(completion: completion)

    }
}
