//
//  MovieDetailsWorker.swift
//  Chillax
//
//  Created by Nattanita on 11/8/2564 BE.
//

import Foundation

protocol IDetailWorker {
    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void)
}

struct DetailWorker {
    let remoteStore: DetailRemoteStore
}

// MARK: - IHomeWorker
extension DetailWorker: IDetailWorker {
    func getDetail( id: Int, completion: @escaping (Result<MovieDetails?, Error>) -> Void) {
        remoteStore.details(id: id, completion: completion)
    }

}
