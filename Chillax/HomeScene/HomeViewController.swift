//
//  HomeViewController.swift
//  Chillax
//
//  Created by Nattanita on 3/8/2564 BE.
//

import UIKit

//protocol IHomeViewController: AnyObject {
//    func showMovies(viewModel: GetMoviesUseCase.ViewModel)
//}

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
//    var interactor: IHomeInteractor!

    var dataList =[Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
//        let presenter = HomePresenter(viewController: self)
//        let remoteStore = HomeRemoteStore()
//        let worker = HomeWorker(remoteStore: remoteStore)
//        interactor = HomeInteractor(presenter: presenter, worker: worker)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Get Movies
//        getMovies()
//    }
        
}
extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.setup(with: dataList[indexPath.row])
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 300)
    }
}

extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(dataList[indexPath.row].originalTitle)
    }
}

//// MARK: - Interactor
//extension HomeViewController {
//    func getMovies() {
//        let request = GetMoviesUseCase.Request()
//        interactor.getMovies(request: request)
//    }
//}
//
//// MARK: - IHomeViewController
//extension HomeViewController: IHomeViewController {
//    func showMovies(viewModel: GetMoviesUseCase.ViewModel) {
//        // Display data in tableview or collection view
//        print("--- showMovies \(viewModel.movies)")
//    }
//}
