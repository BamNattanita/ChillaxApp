//
//  SearchMovieWorker.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import Foundation

protocol ISearchMovieWorker {
    func getSearch( title: String, completion: @escaping (Result<SearchResultResponse?, Error>) -> Void)
}

struct SearchWorker {
    let searchremoteStore: SearchRemoteStore
}

extension SearchWorker: ISearchMovieWorker {
    func getSearch( title: String, completion: @escaping (Result<SearchResultResponse?, Error>) -> Void) {
        searchremoteStore.search(title: title, completion: completion)
    }
}
