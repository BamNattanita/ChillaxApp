////
////  BasketViewController.swift
////  Chillax
////
////  Created by Nattanita on 3/8/2564 BE.
////
//
//
import UIKit
import AFNetworking

protocol IBasketViewController: AnyObject {
    func showMoviesInCart (viewModel: BasketUseCase.ViewModel)
}

class BasketViewController: UIViewController {

    

//    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    

    var interactor: IBasketInteractor!
    var movieLists: [MovieDetails] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        let presenter = BasketPresenter(viewController: self)
        let worker = BasketWorker()

        interactor = BasketInteractor(presenter: presenter, worker: worker)

        tableView.dataSource = self
        tableView.delegate = self
        
//        tableView.register(BasketMovieTableViewCell.self, forCellReuseIdentifier: "BasketMovieTableViewCell")
        
//        moviesInCart()
        interactor?.moviesInCart()
        
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        interactor?.deleteMoviesInCart()
        
    }
}








extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(movieLists.count)
        return movieLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketMovieTableViewCell", for: indexPath) as! BasketMovieTableViewCell
        let movieList = movieLists[indexPath.row]
//        let text = movieList.date
//        cell.day.text = text
        let movieTitle = movieList.title
        let posterurl = movieLists[indexPath.row].posterURL
//        let backdropurl = movieLists[indexPath.row].backdropURL

//        print(posterurl)

        cell.basketMovieTitle?.text = movieTitle

//        cell.TitleNameTable.sizeToFit()

//        cell.textLabel?.text = movieTitle
        cell.basketMovieImage?.setImageWith(posterurl)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            movieLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    

}

extension BasketViewController: IBasketViewController{


    func showMoviesInCart (viewModel: BasketUseCase.ViewModel) {

        self.movieLists = viewModel.movies
        print("movie \(self.movieLists) ")
        
        DispatchQueue.main.async {

            self.tableView.reloadData()
//            print("bam")
        }

    }
    

}
//
//
//
//
////MARK: - Interactor
//
//extension BasketViewController {
//    func moviesInCart() {
////        let request = GetSearchMovieUseCase.Request(title: title)
//
//        interactor?.moviesInCart()
//        print("bam")
//        DispatchQueue.main.async {
//            self.basketTableView.reloadData()
//        }
//
//    }
//}
//
//extension SearchViewController {
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "movieToDetail" {
//            let cell = sender as! MovieTableViewCell
//            let indexPath = tableView.indexPath(for: cell)
//            let id = movieLists[indexPath!.row].id
//            router.openMovieDetailPage(segue: segue, id: id)
//            print(id)
//        }
//    }
//}
//
