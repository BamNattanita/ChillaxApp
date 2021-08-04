//
//  HomePresenter.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

protocol IHomePresenter {
    func presentMovies(response: GetMoviesUseCase.Response)
    func presentError(error: Error)
}

struct HomePresenter {
    weak var viewController: IHomeViewController?
}

extension HomePresenter: IHomePresenter {
    func presentMovies(response: GetMoviesUseCase.Response) {
        let movies = response.movies.compactMap { MovieViewModel(item: $0) }
        let viewModel = GetMoviesUseCase.ViewModel(movies: movies)
        viewController?.showMovies(viewModel: viewModel)
    }
    
    func presentError(error: Error) {
        
    }
}
