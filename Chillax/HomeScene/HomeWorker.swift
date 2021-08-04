//
//  HomeWorker.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

protocol IHomeWorker {
    func getMovies(completion: @escaping (Result<[IMovie]?, Error>) -> Void)
}

struct HomeWorker {
    let remoteStore: IHomeRemoteStore
}

// MARK: - IHomeWorker
extension HomeWorker: IHomeWorker {
    func getMovies(completion: @escaping (Result<[IMovie]?, Error>) -> Void) {
        remoteStore.movies(completion: completion)
    }
}
