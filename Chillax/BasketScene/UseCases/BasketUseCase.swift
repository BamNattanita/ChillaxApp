//
//  BasketUseCase.swift
//  Chillax
//
//  Created by Nattanita on 19/8/2564 BE.
//

import Foundation

enum BasketUseCase {
    struct Request {
        
    }
    
    struct Response {
        var movies : [MovieDetails]
    }
    
    struct ViewModel {
        var movies : [MovieDetails]
        
    }
}
