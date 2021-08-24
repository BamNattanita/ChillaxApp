//
//  MovieDetailsViewController.swift
//  Chillax
//
//  Created by Nattanita on 6/8/2564 BE.
//

import UIKit
import AFNetworking

protocol IMovieDetailsViewController: AnyObject {
    func showDetail (viewModel: GetDetailsUseCase.ViewModel)
    func showSaveToCart (viewModel: AddToCartUseCase.ViewModel)
}

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ratings: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSummary: UITextView!
    @IBOutlet weak var addToCart: UIButton!

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
        movieSummary.isScrollEnabled = false
        movieSummary.translatesAutoresizingMaskIntoConstraints = true
        movieSummary.sizeToFit()
    }

    @IBAction func addToCart(_ sender: UIButton) {
        
        if let movie = movieDetail {
            saveMovieToCart(movieDetails: movie)
            let alert = UIAlertController(title: "Add To Cart Successfully!", message: "'\(movie.title)' has been added to cart.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
        }
            }
        }

func adjustUITextViewHeight(arg: UITextView) {
    arg.translatesAutoresizingMaskIntoConstraints = true
    arg.sizeToFit()
    arg.isScrollEnabled = false
}

extension MovieDetailsViewController: IMovieDetailsViewController {
    
    func showDetail(viewModel: GetDetailsUseCase.ViewModel) {
        let movieDetails = viewModel.item?.movieDetail
        self.movieDetail = movieDetails
      DispatchQueue.main.async {
        self.movieTitle.text = movieDetails?.title
        self.movieSummary.text = movieDetails?.overview
        let backdropurl = movieDetails?.backdropURL
        self.movieImageView.setImageWith(backdropurl!)
        self.ratings.text = movieDetails?.voteAveragePercentText
        self.releaseDate.text = movieDetails?.releaseDate
      }

    }
    
    func showSaveToCart(viewModel: AddToCartUseCase.ViewModel) {
        print("save success")
    }
}

extension MovieDetailsViewController {
    func getDetail(id: Int) {
        let request = GetDetailsUseCase.Request(id: id)
        interactor?.getDetail(request: request)
    }
}

extension MovieDetailsViewController {
    func saveMovieToCart(movieDetails: MovieDetails) {
        let request = AddToCartUseCase.Request(movieDetails: movieDetails)
        interactor?.saveMovie(request: request)
    }
}
