//
//  SearchMovieInteractor.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

protocol ISearchMovieInteractor {
    func getSearch(request: GetSearchMovieUseCase.Request)
}

struct SearchInteractor {
    let presenter: ISearchMoviePresenter
    let worker: ISearchMovieWorker
}

extension SearchInteractor: ISearchMovieInteractor {
    func getSearch(request: GetSearchMovieUseCase.Request) {
        worker.getSearch(title: request.title ) { result in
            switch result {
            case .success(let searchResult):
                let movies = searchResult?.results
                let response = GetSearchMovieUseCase.Response(results: movies)
                presenter.presentSearch(response: response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
}
