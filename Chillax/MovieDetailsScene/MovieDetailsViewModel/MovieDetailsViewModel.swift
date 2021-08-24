//
//  MovieDetailsViewModel.swift
//  Chillax
//
//  Created by Nattanita on 10/8/2564 BE.
//

import Foundation

protocol IMovieDetailsViewModel {

    var movieDetail: MovieDetails? {get}
}

struct MovieDetailsViewModel: IMovieDetailsViewModel {
    var movieDetail: MovieDetails?
}
