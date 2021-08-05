//
//  HomeViewController.swift
//  Chillax
//
//  Created by Nattanita on 3/8/2564 BE.
//

import UIKit
import Foundation
import AFNetworking
//protocol IHomeViewController: AnyObject {
//    func showMovies(viewModel: GetMoviesUseCase.ViewModel)
//}

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var upcomingCollection: UICollectionView!
//    var interactor: IHomeInteractor!

//    var dataList = [Result]()
    var upcoming = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width / 2
                let layout = upcomingCollection.collectionViewLayout as! UICollectionViewFlowLayout
                layout.itemSize = CGSize(width: width, height: width)
                layout.scrollDirection = .vertical
            
//                layout.minimumLineSpacing = 8
            
//                layout.minimumInteritemSpacing = 4
                
                upcomingCollection.delegate = self
                upcomingCollection.dataSource = self
        
                upcomingCollection
                   .setCollectionViewLayout(layout, animated: true)
        
                
                fetchUpcomingMovies()
    }
            
        func fetchUpcomingMovies(){
            let apikey = "2b1f7cd2255bdc2ecbee5920521bb794"
            if let url = NSURL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apikey)&language=en-US&page=1"){
                let request = URLRequest(url: url as URL, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 10)
                let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
                   let task = session.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let data = data{
                        let responseDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    //                    print("responseDictionary : \(responseDictionary)")
                        self.upcoming = responseDictionary["results"] as! [[String:Any]]
                        self.upcomingCollection.reloadData()
                   }
                }
                   task.resume()
                }
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return upcoming.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            
            let movie = upcoming[indexPath.row]
            let title = movie["title"] as! String
            let posterPath = movie["poster_path"] as? String ?? ""

            let baseUrl = "https://image.tmdb.org/t/p/w500"
            let posterUrl = URL(string: baseUrl + posterPath)

            cell.movieName.text = title
            cell.movieName.sizeToFit()
            cell.movieImageView.setImageWith(posterUrl!)
            return cell
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
