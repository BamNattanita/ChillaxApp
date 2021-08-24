//
//  AddToCartUseCase.swift
//  Chillax
//
//  Created by Nattanita on 18/8/2564 BE.
//

import Foundation

enum AddToCartUseCase {
    struct Request {
        var movieDetails: MovieDetails
    }
    struct Response {
        var isSuccess: Bool
    }
    struct ViewModel {
        var isSuccess: Bool
    }
}
