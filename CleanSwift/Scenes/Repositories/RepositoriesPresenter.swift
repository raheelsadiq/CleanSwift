//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

protocol RepositoriesPresentationLogic {
    func presentRepos(response: Repositories.Models.Response)
}

class RepositoriesPresenter: RepositoriesPresentationLogic {
    weak var viewController: RepositoriesDisplayLogic?
    
    // MARK: Present
    
    func presentRepos(response: Repositories.Models.Response) {
        
    }
    
}
