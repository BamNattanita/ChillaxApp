////
////  HomeRemoteStore.swift
////  Chillax
////
////  Created by Nattanita on 5/8/2564 BE.
////
//
//import Foundation
//
//protocol IHomeRemoteStore {
//    func movies(completion: @escaping (Result<[IMovie]?, Error>) -> Void)
//}
//
//struct HomeRemoteStore {
//    let apiService: IHomeAPIService
//    
//    init() {
//        self.apiService = HomeAPIService()
//    }
//}
//
//extension HomeRemoteStore: IHomeRemoteStore {
//    func movies(completion: @escaping (Result<[IMovie]?, Error>) -> Void) {
//        // Call API here
//        // apiService.xxx
//        // sample
//        let movie1 = Movie(id: "a123", name: "JohnWick")
//        let movie2 = Movie(id: "b456", name: "RickAndMorty")
//        
//        completion(.success([movie1, movie2]))
//    }
//}
