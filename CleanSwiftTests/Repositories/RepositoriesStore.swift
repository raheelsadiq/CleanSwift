//
//  RepositoriesStore.swift
//  CleanSwiftTests
//
//  Created by Raheel Sadiq on 30/11/2020.
//

import XCTest
@testable import CleanSwift

class RepositoriesStore: XCTestCase {

    static let sampleRepo = Repositories.Models.Response.Repo(
        author: "John",
        name: "CleanSwift",
        avatar: "https://avatars0.githubusercontent.com/u/1942602?s=460&u=84ab5e4c9f95a25fd73d30b7f6d3df32aef4ceaa&v=4",
        language: "swift",
        description: "Clean Swift",
        stars: 5)
    
    static let sampleViewModel =  Repositories.Models.ViewModel(
        author: "John",
        name: "CleanSwift",
        avatar: URL(string:"https://avatars0.githubusercontent.com/u/1942602?s=460&u=84ab5e4c9f95a25fd73d30b7f6d3df32aef4ceaa&v=4"),
        language: "Swift",
        description: "Clean Swift",
        stars: "5")

    
    static let repos: [Repositories.Models.Response.Repo] = [
        .init(author: "Jinxiansen", name: "SwiftUI", avatar: "https://github.com/Jinxiansen.png", language: "Swift", description: "SwiftUI` Framework Learning and Usage Guide. 🚀", stars: 3236),
        .init(author: "nextcloud", name: "ios", avatar: "https://github.com/nextcloud.png", language: "Swift", description: "📱 Nextcloud iOS app", stars: 885)
    ]
    
    static let viewModels: [Repositories.Models.ViewModel] = [
        .init(repo: repos[0]),
        .init(repo: repos[1])
    ]
    
}
