//
//  MovieDetailsAPIService.swift
//  Chillax
//
//  Created by Nattanita on 13/8/2564 BE.
//

import Foundation

protocol IDetailAPIService {
    func details(
        completion: @escaping (Result<[MovieDetails]?, Error>) -> Void
    )
}


class DetailService {
    
    var detailStore: IDetailAPIService
    
    init(detailStore: IDetailAPIService) {
        self.detailStore = detailStore
    }
    
    func details(
        completion: @escaping (Result<[MovieDetails]?, Error>) -> Void

    ) {
        detailStore.details(completion: completion)

    }
}
