//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

class RepositoriesWorker {
    
    func fetchRepos(
        request: Repositories.Models.Request,
        success: @escaping ((_ repos: [Repositories.Models.Response]) -> Void),
        failure: @escaping (() -> Void)
    ){
        
        success([])
        
    }
}
