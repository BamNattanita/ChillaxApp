////
////  MovieDetailsViewController.swift
////  Chillax
////
////  Created by Nattanita on 6/8/2564 BE.
////
//
////import Foundation
import UIKit
import AFNetworking


protocol IMovieDetailsViewController: AnyObject {
    func showDetail (viewModel: GetDetailsUseCase.ViewModel)
}

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ratings: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSummary: UITextView!

//    var movieDetail: String = ""
//    var displayMovies: [IMovieDetailsViewModel] = []
    var id: Int!

    var interactor: IDetailInteractor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = DetailPresenter(viewController: self)
        let remoteStore = DetailRemoteStore()
        let worker = DetailWorker(remoteStore: remoteStore)
        interactor = DetailInteractor(presenter: presenter, worker: worker)
        
        getDetail(id: id)
//        print(id)
//        let index = displayMovies.firstIndex{$0 === movieDetail}movieImageView.setImageWith(posterUrl!)
        
//        movieTitle.text = movieDetails.title as? String
//        movieTitle.sizeToFit()
//
//        let releaseDate = movieDetails.releaseDate as! String
//        releaseDate.text = ("Released On: \(releaseDate)")
//
//        let ratings = movieDetails.voteAverage as? NSNumber
//        ratings.text = ("Ratings: \(ratings!.stringValue)/10")
//
//        movieSummary.text = movieDetails.overview as? String
//        movieSummary.sizeToFit()
//
    }

}

extension MovieDetailsViewController: IMovieDetailsViewController {
    
    func showDetail(viewModel: GetDetailsUseCase.ViewModel) {
        
        let detailViewModel = viewModel.details
//        print(detailViewModel)
//        let  backdropURL = movieDetails.backdropURL
//
      DispatchQueue.main.async {
        self.movieTitle.text = detailViewModel?.title
        self.movieSummary.text = detailViewModel?.overview
        let backdropurl = detailViewModel?.backdropURL

        self.movieImageView.setImageWith(backdropurl!)
        self.ratings.text = detailViewModel?.voteAveragePercentText
    }
        
//        releaseDate.text = movieDetails.releaseDate
//        ratings.text = movieDetails.voteAverage


    }
    
    
}

//MARK: - Interactor

extension MovieDetailsViewController {
    func getDetail(id: Int) {
        let request = GetDetailsUseCase.Request(id: id)
        interactor?.getDetail(request: request)
    }
    
}
