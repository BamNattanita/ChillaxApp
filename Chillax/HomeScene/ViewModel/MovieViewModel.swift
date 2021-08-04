//
//  MovieViewModel.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import Foundation

protocol IMovieViewModel {
    var name: String { get }
}

struct MovieViewModel: IMovieViewModel {
    var name: String
}

// MARK: - Init from Model
extension MovieViewModel {
    init(item: MovieResult) {
        self.name = item.id + " " + item.name
    }
}
