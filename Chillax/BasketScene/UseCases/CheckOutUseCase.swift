//
//  CheckoutUseCase.swift
//  Chillax
//
//  Created by Nattanita on 22/8/2564 BE.
//

import Foundation

enum CheckOutUseCase {
    
    struct Request{
        var movieDetails: [MovieDetails]
    }
    
    struct Response{
        var isSuccess: Bool
    }
    
    struct ViewModel{
        var isSuccess: Bool
    }
}
