//
//  SearchMoviePresenter.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

protocol ISearchMoviePresenter {
    func presentSearch(response: GetSearchMovieUseCase.Response)
    func presentError(error: Error)
}

struct SearchPresenter {
    weak var viewController: ISearchMovieViewController?
    var searches: [ISearchMovieViewModel] = []
    init(viewController: ISearchMovieViewController) {
        self.viewController = viewController
    }

}

extension SearchPresenter: ISearchMoviePresenter {
    func presentSearch(response: GetSearchMovieUseCase.Response) {
        let searchmovie = response.results?.compactMap { SearchMovieViewModel(searchMovie: $0) }
        let viewModel = GetSearchMovieUseCase.ViewModel(movies: searchmovie)
        viewController?.showSearch(viewModel: viewModel)
    }
    func presentError(error: Error) {
    }
}
