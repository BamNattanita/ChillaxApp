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
    
    //    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var SearchBar: UIView!
    @IBOutlet weak var SearchText: UITextField!
//    @IBOutlet weak var MovieName: UILabel!
    
//    var title: String!
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
        
        SearchText.delegate = self
        SearchBar.isHidden = false
        SearchText.placeholder = "Search Movie"
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        
        
        
    }

    @IBAction func ShowSearchBar(_ sender: UIButton) {
        if SearchBar.isHidden {
            SearchBar.isHidden = false
        } else {
            SearchBar.isHidden = true
        }
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchText.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = SearchText.text {
            getSearch(title: text)
        }
        SearchBar.isHidden = true
//        MovieName.isHidden = false
//        MovieImage.isHidden = false

    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(movieLists)
        return movieLists.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let movieList = movieLists[indexPath.row]
//        let text = movieList.date
//        cell.day.text = text
        let movieTitle = movieList.title
        let posterurl = movieLists[indexPath.row].posterURL
        let backdropurl = movieLists[indexPath.row].backdropURL

//        print(movieTitle)
        
        cell.titleLabel?.text = movieTitle
        
//        cell.TitleNameTable.sizeToFit()
        
//        cell.textLabel?.text = movieTitle
        cell.moviePoster?.setImageWith(backdropurl!)
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




//MARK: - Interactor

extension SearchViewController {
    func getSearch(title: String) {
        let request = GetSearchMovieUseCase.Request(title: title)
        interactor?.getSearch(request: request)
       
    }
}

extension SearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieToDetail" {
            let cell = sender as! MovieTableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let id = movieLists[indexPath!.row].id
            router.openMovieDetailPage(segue: segue, id: id)
            print(id)
        }
    }
}
