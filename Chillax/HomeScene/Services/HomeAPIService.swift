//
//  HomeAPIService.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.

import Foundation

protocol IHomeAPIService {
    func movies(success: @escaping (_ movie: [MoviesResponse])-> Void, failure: @escaping (_ error: ErrorResponse)-> Void)
}

class MovieService {
    
    var movieStore: IHomeAPIService
    
    init(movieStore: IHomeAPIService) {
        self.movieStore = movieStore
    }
    
    func movies(onSuccess: @escaping (_ movies: [Movie]) -> Void, onFailure: @escaping (_ error: ErrorResponse) -> Void) {
        movieStore.movies { (response) in
        } failure: { (error: ErrorResponse) in
                onFailure(error)
        }
    }
}

public enum ErrorResponse: String {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return "Error api"
        case .invalidEndpoint: return "Error endpoint"
        case .invalidResponse: return "Error response"
        case .noData: return "Error data"
        case .serializationError: return "Error serialization process"
        }
    }
}

