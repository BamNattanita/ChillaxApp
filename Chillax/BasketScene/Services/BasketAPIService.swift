//
//  BasketAPIService.swift
//  Chillax
//
//  Created by Nattanita on 19/8/2564 BE.
//

import Foundation

protocol IBasketAPIService {
    func basket(
        completion: @escaping (Result<[MovieDetails]?, Error>) -> Void
    )
}


class BasketService {
    
    var basketStore: IBasketAPIService
//
    init(basketStore: IBasketAPIService) {
        self.basketStore = basketStore
    }
    
    func basket(
        completion: @escaping (Result<[MovieDetails]?, Error>) -> Void

    ) {
        basketStore.basket(completion: completion)

    }
}

