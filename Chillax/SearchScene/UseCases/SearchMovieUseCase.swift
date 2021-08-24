//
//  SearchMovieUseCase.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

enum GetSearchMovieUseCase {
    struct Request {
        var title: String
    }
    struct Response {
        var results: [SearchMovie]?
    }
    struct ViewModel {
        var movies: [ISearchMovieViewModel]?
    }
}
