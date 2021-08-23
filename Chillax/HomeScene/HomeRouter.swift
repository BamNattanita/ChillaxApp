//
//  HomeRouter.swift
//  Chillax
//
//  Created by Nattanita on 5/8/2564 BE.
//

import UIKit

protocol IHomeRouter {
    var viewController: HomeViewController? { get set }
    func openMovieDetail(segue: UIStoryboardSegue?, id: Int)
}

class HomeRouter: IHomeRouter {
    weak var viewController: HomeViewController?
    
    func openMovieDetail(segue: UIStoryboardSegue?, id: Int) {
        if let detailViewController = segue?.destination as? MovieDetailsViewController {
            detailViewController.id = id
        }
    }
}



