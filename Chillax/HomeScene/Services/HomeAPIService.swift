//
//  HomeAPIService.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.

import Foundation

protocol IHomeAPIService {
    func movies(
        completion: @escaping (Result<[Movie]?, Error>) -> Void
    )
}


class MovieService {
    
    var movieStore: IHomeAPIService
    
    init(movieStore: IHomeAPIService) {
        self.movieStore = movieStore
    }
    
    func movies(
        completion: @escaping (Result<[Movie]?, Error>) -> Void

    ) {
        movieStore.movies(completion: completion)

    }
}

//public enum ErrorResponse: String {
//    case apiError
//    case invalidEndpoint
//    case invalidResponse
//    case noData
//    case serializationError
//
//    public var description: String {
//        switch self {
//        case .apiError: return "Error api"
//        case .invalidEndpoint: return "Error endpoint"
//        case .invalidResponse: return "Error response"
//        case .noData: return "Error data"
//        case .serializationError: return "Error serialization process"
//        }
//    }
//}

