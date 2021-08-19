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
}

struct BasketPresenter {
    weak var viewController: IBasketViewController?
//    var detail: [IMovieDetailsViewModel] = []
//
    init(viewController: IBasketViewController) {
        self.viewController = viewController
    }

}

extension BasketPresenter: IBasketPresenter {
    func presentMovies(response: BasketUseCase.Response) {
        let viewModel = BasketUseCase.ViewModel( movies : response.movies)
        viewController?.showMoviesInCart(viewModel: viewModel)

    }
    
    func presentError(error: Error) {
    }
    
    func presentMoviesCleared(response: BasketUseCase.Response){
        let viewModel = BasketUseCase.ViewModel(movies: response.movies)
        viewController?.showMoviesInCart(viewModel: viewModel)
    }
}
