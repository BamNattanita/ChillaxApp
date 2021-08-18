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
//    func selectedMovie (viewModel: GetSelectedMovieUseCase.ViewModel)
    func showSaveToCart (viewModel: AddToCartUseCase.ViewModel)
}

//var movies: [Any] = []
class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ratings: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSummary: UITextView!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    
    
//    var movieDetail: String = ""
//    var displayMovies: [IMovieDetailsViewModel] = []
    var id: Int!

    var movieDetail: MovieDetails?
    var interactor: IDetailInteractor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = DetailPresenter(viewController: self)
        let remoteStore = DetailRemoteStore()
        let worker = DetailWorker(remoteStore: remoteStore)
        interactor = DetailInteractor(presenter: presenter, worker: worker)
        
        getDetail(id: id)
//        print(id)
        

        
//
    }
        


    

    @IBAction func addToCart(_ sender: UIButton) {
        
        

   
        
    }
    

}

extension MovieDetailsViewController: IMovieDetailsViewController {
    
    func showDetail(viewModel: GetDetailsUseCase.ViewModel) {
        
        let movieDetails = viewModel.details
//        self.movieDetail = movieDetails
////        selectedPoster = detailViewModel?.posterURL
////        print(detailViewModel)
////        let  backdropURL = movieDetails.backdropURL
////
//      DispatchQueue.main.async {
//        self.movieTitle.text = movieDetails?.title
//        self.movieSummary.text = movieDetails?.overview
//        let backdropurl = movieDetails?.backdropURL
//
//        self.movieImageView.setImageWith(backdropurl!)
//        self.ratings.text = movieDetails?.voteAveragePercentText
//        self.releaseDate.text = movieDetails?.releaseDate
//        self.language.text = movieDetails?.originalLanguage
    
        
//        releaseDate.text = movieDetails.releaseDate
//        ratings.text = movieDetails.voteAverage


    }
    func showSaveToCart(viewModel: AddToCartUseCase.ViewModel) {
        print("success")
    }
    
    
    
}

//MARK: - Interactor

extension MovieDetailsViewController {
    func getDetail(id: Int) {
        let request = GetDetailsUseCase.Request(id: id)
        interactor?.getDetail(request: request)
    }
    
}

//extension SearchViewController {
//    func getSearch(id: Int) {
//        let request = GetDetailsUseCase.Request(id: id)
//        interactor?.getDetail(request: request)
//    }
    
//}
