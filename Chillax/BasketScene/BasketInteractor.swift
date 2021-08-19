//
//  BasketInteractor.swift
//  Chillax
//
//  Created by Nattanita on 19/8/2564 BE.
//

import Foundation

protocol IBasketInteractor {
//    func getDetail(request: GetDetailsUseCase.Request)
//    func saveMovie(request: AddToCartUseCase.Request)
    func moviesInCart()
    func deleteMoviesInCart()
}

struct BasketInteractor {
    let presenter: IBasketPresenter
    let worker: IBasketWorker
}

extension BasketInteractor: IBasketInteractor {
    func moviesInCart() {
        worker.loadCart() { result in
            switch result {
            case .success(let loadMovies):
                let response = BasketUseCase.Response( movies: loadMovies)
                presenter.presentMovies(response: response)
//                print(response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
    
    func deleteMoviesInCart() {
        worker.clearMoviesInCart() { result in
            switch result {
            case .success(let clearMovies):
                let response = BasketUseCase.Response (movies: clearMovies)
                presenter.presentMoviesCleared(response: response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
    
    

}


