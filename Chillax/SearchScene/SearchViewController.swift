//
//  SearchViewController.swift
//  Chillax
//
//  Created by Nattanita on 3/8/2564 BE.
//

import UIKit
import AFNetworking

protocol ISearchMovieViewController: AnyObject {
    func showSearch (viewModel: GetSearchMovieUseCase.ViewModel)
}

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var searchText: UITextField!
    
    var router: ISearchRouter!
    var interactor: ISearchMovieInteractor!
    var movieLists: [ISearchMovieViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = SearchPresenter(viewController: self)
        let searchremoteStore = SearchRemoteStore()
        let worker = SearchWorker(searchremoteStore: searchremoteStore)
        router = SearchRouter()
        router.viewController = self
        interactor = SearchInteractor(presenter: presenter, worker: worker)
        searchText.delegate = self
        searchBar.isHidden = false
        searchText.placeholder = "Search Movie"
        tableView.dataSource = self
        tableView.delegate = self
        getSearch(title: "boss")
    }

    @IBAction func showSearchBar(_ sender: UIButton) {
        if searchBar.isHidden {
            searchBar.isHidden = false
        } else {
            searchBar.isHidden = true
        }
    }
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchText.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = searchText.text {
            getSearch(title: text)
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieLists.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movieList = movieLists[indexPath.row]
        let movieTitle = movieList.title
        let posterurl = movieLists[indexPath.row].posterURL
        let movieRating = movieList.voteRating
        let movieDate = movieList.releaseDate
        cell.movieRating?.text = movieRating
        cell.titleLabel?.text = movieTitle
        cell.movieDate?.text = movieDate
        cell.moviePoster?.setImageWith(posterurl!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension SearchViewController: ISearchMovieViewController {
    func showSearch(viewModel: GetSearchMovieUseCase.ViewModel) {
        self.movieLists = viewModel.movies ?? []
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension SearchViewController {
    func getSearch(title: String) {
        let request = GetSearchMovieUseCase.Request(title: title)
        interactor?.getSearch(request: request)
    }
}

extension SearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieToDetail" {
            if let cell = sender as? MovieTableViewCell {
            let indexPath = tableView.indexPath(for: cell)
            let id = movieLists[indexPath!.row].id
            router.openMovieDetailPage(segue: segue, id: id)
            }
        }
    }
}
