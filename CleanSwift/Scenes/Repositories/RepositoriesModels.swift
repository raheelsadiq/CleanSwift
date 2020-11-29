//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

enum Repositories
{
    // MARK: Use cases
    
    enum Models {
        
        struct Request {
        }
        
        struct Response: Codable {
            
            let author: String?
            let name: String
            let avatar: String
            let language: String
            let description: String
            let stars: Int
            
        }
        
        struct ViewModel {
            
        }
    }
}
