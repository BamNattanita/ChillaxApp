//
//  SearchMovieRouter.swift
//  Chillax
//
//  Created by Nattanita on 16/8/2564 BE.
//

import UIKit

protocol ISearchRouter {
    var viewController: SearchViewController? { get set }
    func openMovieDetailPage(segue: UIStoryboardSegue?, id: Int)
}

class SearchRouter: ISearchRouter {
    weak var viewController: SearchViewController?
    
    func openMovieDetailPage(segue: UIStoryboardSegue?, id: Int) {
        if let searchViewController = segue?.destination as? MovieDetailsViewController {
            searchViewController.id = id
        }
    }
}
