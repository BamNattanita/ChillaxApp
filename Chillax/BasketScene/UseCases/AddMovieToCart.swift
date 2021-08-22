//
//  AddMovieToCart.swift
//  Chillax
//
//  Created by Nattanita on 20/8/2564 BE.
//

import Foundation

enum AddMovieToCartUseCase {
    
    struct Request{
        var movieDetails : MovieDetails
    }
    
    struct Response{
        var isSuccess : Bool
    }
    
    struct ViewModel{
        var isSuccess : Bool
    }
}
