//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

class RepositoriesWorker {
    
    var apiManager = APIManager(service: AlamoreFireAPIService())

    func fetchRepos(
        request: Repositories.Models.Request,
        completion: @escaping ((_ status: APIManager.Status) -> Void)
    ){
            
        let apiRequest = APIManager.Request(url: .fetchRepositories, methodType: .get, params: nil)
        
        apiManager.execute(request: apiRequest) { (status) in
            completion(status)
        }
    }
}
