//
//  MovieDetailsInteractor.swift
//  Chillax
//
//  Created by Nattanita on 11/8/2564 BE.
//

import Foundation

protocol IDetailInteractor {
    func getDetail(request: GetDetailsUseCase.Request)
}

struct DetailInteractor {
    let presenter: IDetailPresenter
    let worker: IDetailWorker
}

extension DetailInteractor: IDetailInteractor {
    func getDetail(request: GetDetailsUseCase.Request) {
        worker.getDetail(id: request.id ) { result in
            switch result {
            case .success(let details):
                let response = GetDetailsUseCase.Response(details: details )
                presenter.presentDetails(response: response)
            case .failure(let error):
                presenter.presentError(error: error)
            }
        }
    }
}

