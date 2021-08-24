//
//  BasketInteractor.swift
//  Chillax
//
//  Created by Nattanita on 19/8/2564 BE.
//

import Foundation

protocol IBasketInteractor {
    func moviesInCart()
    func deleteMoviesInCart()
    func saveMovieToCart(request: AddMovieToCartUseCase.Request)
    func checkOutCart(request: CheckOutUseCase.Request)
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
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
    
    func deleteMoviesInCart() {
        worker.clearMoviesInCart() { result in
            switch result {
            case .success(let clearMovies):
                let response = BasketUseCase.Response(movies: clearMovies)
                presenter.presentMoviesCleared(response: response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
    
    func saveMovieToCart(request: AddMovieToCartUseCase.Request) {
        worker.addMovieToCart(movieDetails: request.movieDetails ) { result in
            switch result {
            case .success(let isSuccess):
                let response = AddMovieToCartUseCase.Response( isSuccess: isSuccess)
                presenter.presentMovieInCart(response: response)
                print(response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
    
    func checkOutCart(request: CheckOutUseCase.Request) {
        worker.checkOutMoviesInCart(movieDetails: request.movieDetails ) { result in
            switch result {
            case .success(let isSuccess):
                let response = CheckOutUseCase.Response( isSuccess: isSuccess)
                presenter.presentCheckOut(response: response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
}
