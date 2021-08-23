//
//  GetMoviesUseCase.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

enum GetMoviesUseCase {
    struct Request {
        
    }
    
    struct Response {
        var movies: [Movie]
    }
    
    struct ViewModel {
        var movies: [IMovieViewModel]
    }
}
