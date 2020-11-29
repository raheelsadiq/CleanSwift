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
        
        struct Response {
            var repos: [Repo] = []
            struct Repo: Codable {
                let author: String
                let name: String
                let avatar: String
                let language: String
                let description: String
                let stars: Int
            }
        }
        
        struct ViewModel {

            let author: String
            let name: String
            let avatar: URL?
            let language: String
            let description: String
            let stars: String
            
            init(repo: Response.Repo) {
                author = repo.author
                name = repo.name
                avatar = URL(string: repo.avatar)
                language = repo.language.capitalized
                description = repo.description
                stars = String(repo.stars)
            }
            
            internal init(author: String, name: String, avatar: URL?, language: String, description: String, stars: String) {
                self.author = author
                self.name = name
                self.avatar = avatar
                self.language = language
                self.description = description
                self.stars = stars
            }
        }
    }
}
