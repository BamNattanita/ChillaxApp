//
//  HomeInteractor.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

protocol IHomeInteractor {
    func getMovies(request: GetMoviesUseCase.Request)
}

struct HomeInteractor {
    let presenter: IHomePresenter
    let worker: IHomeWorker
}

// MARK: - IHomeInteractor
extension HomeInteractor: IHomeInteractor {
    func getMovies(request: GetMoviesUseCase.Request) {
        worker.getMovies { result in
            switch result {
            case .success(let movies):
                let response = GetMoviesUseCase.Response(movies: movies ?? [])
                presenter.presentMovies(response: response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
}
