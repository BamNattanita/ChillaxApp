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
    func showSaveMovieToCart(viewModel: AddMovieToCartUseCase.ViewModel)
    func showCheckOut(viewModel: CheckOutUseCase.ViewModel)
}

class BasketViewController: UIViewController {

    

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
        
//        navigationItem.leftBarButtonItem = editButtonItem
        
//        tableView.allowsMultipleSelectionDuringEditing = true
//        tableView.setEditing(true, animated: false)


        
//        tableView.register(BasketMovieTableViewCell.self, forCellReuseIdentifier: "BasketMovieTableViewCell")
        
//        moviesInCart()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.moviesInCart()
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        interactor?.deleteMoviesInCart()
        
    }
    
    @IBAction func checkoutButton(_ sender: UIButton) {
        checkOutCart(movieDetails: movieLists)
        interactor?.deleteMoviesInCart()
        let alert = UIAlertController(title: "Check Out Successfully!", message: "Your cart has been checked out.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
        
        
        

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
        let movieTitle = movieList.title

//        let posterurl = movieLists[indexPath.row].posterURL
        let backdropurl = movieLists[indexPath.row].backdropURL
//        print(posterurl)
        cell.basketMovieTitle?.text = movieTitle
//        cell.TitleNameTable.sizeToFit()
        cell.basketMovieImage?.setImageWith(backdropurl)
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
//            print(movieLists[indexPath.row])
//            resaveMovieToCart(movieDetails: movieLists[indexPath.row])
            movieLists.remove(at: indexPath.row)
            resaveMovieToCart(movieDetails: movieLists)

            
            
//            save new list to database here
//            print(movieLists)
            
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    

}

extension BasketViewController: IBasketViewController{

    func showMoviesInCart (viewModel: BasketUseCase.ViewModel) {
        self.movieLists = viewModel.movies
//        print("movie \(self.movieLists) ")
        DispatchQueue.main.async {
            self.tableView.reloadData()
//            print("bam")
        }
    }
    
    func showSaveMovieToCart(viewModel: AddMovieToCartUseCase.ViewModel) {
//        print("success")
        let basketStoreKey = "basketMovies"
        let data = UserDefaults.standard.data(forKey: basketStoreKey)
//        print(data)
    }
    
    func showCheckOut(viewModel: CheckOutUseCase.ViewModel) {
        print("success")
//        let basketStoreKey = "basketMovies"
//        let data = UserDefaults.standard.data(forKey: basketStoreKey)
//        print(data)
    }
}
//
//
//
//
////MARK: - Interactor

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue
              layer.masksToBounds = (newValue > 0)
            
            
        }
    }
}

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

//
extension BasketViewController {
    func resaveMovieToCart(movieDetails: [MovieDetails]) {
        let request = AddMovieToCartUseCase.Request(movieDetails: movieDetails)
        interactor?.saveMovieToCart(request: request)
//        print("savemovie: \(movieDetails)")
    }
    
    func checkOutCart(movieDetails: [MovieDetails]) {
        let request = CheckOutUseCase.Request(movieDetails: movieDetails)
        interactor?.checkOutCart(request: request)
        
    }
//
}


