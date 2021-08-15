//
//  MovieDetailsPresenter.swift
//  Chillax
//
//  Created by Nattanita on 11/8/2564 BE.
//

import Foundation

protocol IDetailPresenter {
    func presentDetails(response: GetDetailsUseCase.Response)
    func presentError(error: Error)
}

struct DetailPresenter {
    weak var viewController: IMovieDetailsViewController?
    var detail: [IMovieDetailsViewModel] = []
    
    init(viewController: IMovieDetailsViewController) {
        self.viewController = viewController
    }

}

extension DetailPresenter: IDetailPresenter {
    func presentDetails(response: GetDetailsUseCase.Response) {
        let movie = MovieDetailsViewModel (movieDetails: response.details)
        let viewModel = GetDetailsUseCase.ViewModel(details: movie)
        viewController?.showDetail(viewModel: viewModel)

    }
    
    func presentError(error: Error) {
    }
}