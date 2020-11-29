//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

protocol RepositoriesBusinessLogic
{
    func fetchRepos(request: Repositories.Models.Request)
}

protocol RepositoriesDataStore {
}

class RepositoriesInteractor: RepositoriesBusinessLogic, RepositoriesDataStore {
    
    var presenter: RepositoriesPresentationLogic?
    var worker: RepositoriesWorker?
    
    // MARK: Requests
    
    func fetchRepos(request: Repositories.Models.Request) {
        
        
    }
}
