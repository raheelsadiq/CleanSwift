//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

protocol RepositoriesPresentationLogic {
    func present(response: Repositories.Models.Response)
    func presentFailure()
}

class RepositoriesPresenter: RepositoriesPresentationLogic {
    weak var viewController: RepositoriesDisplayLogic?
    
    // MARK: Present
    
    func present(response: Repositories.Models.Response) {
        var viewModels: [Repositories.Models.ViewModel] = []
        
        for repo in response.repos {
            viewModels.append(.init(repo: repo))
        }
        
        viewController?.displayRepos(viewModels: viewModels)
    }
    
    func presentFailure() {
        viewController?.displayFailure()
    }
}
