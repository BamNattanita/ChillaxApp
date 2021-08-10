//
//  HomeViewController.swift
//  Chillax
//
//  Created by Nattanita on 3/8/2564 BE.
//
import UIKit
import AFNetworking

protocol IHomeViewController: AnyObject {
    func showMovies(viewModel: GetMoviesUseCase.ViewModel)
}

class HomeViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var interactor: IHomeInteractor!
    var displayMovies: [IMovieViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = HomePresenter(viewController: self)
        let remoteStore = HomeRemoteStore()
        let worker = HomeWorker(remoteStore: remoteStore)
        interactor = HomeInteractor(presenter: presenter, worker: worker)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getMovies()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayMovies.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let movie = displayMovies[indexPath.row]
        let title = movie.title
        let posterurl = displayMovies[indexPath.row].posterURL
        
        cell.movieName.text = title
        cell.movieName.sizeToFit()
        
        cell.movieImageView.setImageWith(posterurl!)
        return cell
    }
    
}

// MARK: - Interactor
extension HomeViewController {
    func getMovies() {
        let request = GetMoviesUseCase.Request()
        interactor.getMovies(request: request)
    }
}

// MARK: - IHomeViewController
extension HomeViewController: IHomeViewController {

    func showMovies(viewModel: GetMoviesUseCase.ViewModel) {
        self.displayMovies = viewModel.movies
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
            
}



}

