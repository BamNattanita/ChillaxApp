//
//  BasketPresenter.swift
//  Chillax
//
//  Created by Nattanita on 19/8/2564 BE.
//

import Foundation

protocol IBasketPresenter {
    func presentMovies(response: BasketUseCase.Response)
    func presentError(error: Error)
    func presentMoviesCleared(response: BasketUseCase.Response)
    func presentMovieInCart(response: AddMovieToCartUseCase.Response)
    func presentCheckOut(response: CheckOutUseCase.Response)

}

struct BasketPresenter {
    weak var viewController: IBasketViewController?
    
    init(viewController: IBasketViewController) {
        self.viewController = viewController
    }

}

extension BasketPresenter: IBasketPresenter {
    func presentMovies(response: BasketUseCase.Response) {
        let viewModel = BasketUseCase.ViewModel(movies: response.movies)
        viewController?.showMoviesInCart(viewModel: viewModel)
    }
    
    func presentError(error: Error) {
    }
    
    func presentMoviesCleared(response: BasketUseCase.Response){
        let viewModel = BasketUseCase.ViewModel(movies: response.movies)
        viewController?.showMoviesInCart(viewModel: viewModel)
    }
    
    func presentMovieInCart(response: AddMovieToCartUseCase.Response) {
        let viewModel = AddMovieToCartUseCase.ViewModel(isSuccess: response.isSuccess)
        viewController?.showSaveMovieToCart(viewModel: viewModel)
    }
    
    func presentCheckOut(response: CheckOutUseCase.Response) {
        let viewModel = CheckOutUseCase.ViewModel(isSuccess: response.isSuccess)
        viewController?.showCheckOut(viewModel: viewModel)
    }

}
