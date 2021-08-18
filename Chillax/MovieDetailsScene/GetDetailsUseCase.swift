//
//  GetDetailsUseCase.swift
//  Chillax
//
//  Created by Nattanita on 11/8/2564 BE.
//

import Foundation

enum GetDetailsUseCase {
    struct Request {
        var id: Int
    }
    
    struct Response {
        var details: MovieDetails?
    }
    
    struct ViewModel {
        var item: IMovieDetailsViewModel?
    }
}
