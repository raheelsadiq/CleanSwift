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
    var worker: RepositoriesWorker = RepositoriesWorker()
    
    // MARK: Requests
    
    func fetchRepos(request: Repositories.Models.Request) {
        
        worker.fetchRepos(request: request) { [weak self] (status) in
            switch status {
            case .success(let data):
                var responses: [Repositories.Models.Response] = []
                if let jsons = data as? [[String: Any]] {
                    for json in jsons {
                        do {
                            let resonse = try Repositories.Models.Response.init(from: json)
                            responses.append(resonse)
                        }catch{
                            
                        }
                    }
                }
                
                self?.presenter?.presentRepos(response: responses)
                
            case .failure(_):
                self?.presenter?.presentFailure()
            case .internetUnavailable:
                self?.presenter?.presentFailure()
            case .notHandled:
                self?.presenter?.presentFailure()
            }
            
        }
    }
}

extension Decodable {
  init(from: Any) throws {
    let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
    let decoder = JSONDecoder()
    self = try decoder.decode(Self.self, from: data)
  }
}
