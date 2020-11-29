//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//


@testable import CleanSwift
import XCTest

class RepositoriesPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: RepositoriesPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupRepositoriesPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupRepositoriesPresenter() {
        sut = RepositoriesPresenter()
    }
    
    // MARK: Test doubles
    
    class RepositoriesDisplayLogicSpy: RepositoriesDisplayLogic {
        var displayReposCalled = false
        var displayFailureCalled = false
        var viewModels: [Repositories.Models.ViewModel] = []
        func displayRepos(viewModels: [Repositories.Models.ViewModel])
        {
            self.viewModels = viewModels
            displayReposCalled = true
        }
        
        func displayFailure(){
            displayFailureCalled = true
        }
    }
    
    // MARK: Tests
    
    func testDisplayRepos() {
        // Given
        let spy = RepositoriesDisplayLogicSpy()
        sut.viewController = spy
        let response = Repositories.Models.Response()
        
        // When
        sut.present(response: response)
        
        // Then
        XCTAssertTrue(spy.displayReposCalled, "Display called")
    }
    
    func testViewModelsData() {
        // Given
        let spy = RepositoriesDisplayLogicSpy()
        sut.viewController = spy
        
        let repo = Repositories.Models.Response.Repo(
            author: "John",
            name: "CleanSwift",
            avatar: "https://avatars0.githubusercontent.com/u/1942602?s=460&u=84ab5e4c9f95a25fd73d30b7f6d3df32aef4ceaa&v=4",
            language: "swift",
            description: "Clean Swift",
            stars: 5)
        
        
        // Expected view model of the example repo above
        let expectedViewModel = Repositories.Models.ViewModel(
            author: "John",
            name: "CleanSwift",
            avatar: URL(string:"https://avatars0.githubusercontent.com/u/1942602?s=460&u=84ab5e4c9f95a25fd73d30b7f6d3df32aef4ceaa&v=4"),
            language: "Swift",
            description: "Clean Swift",
            stars: "5")
        
        let response = Repositories.Models.Response(repos: [repo])
        // When
        sut.present(response: response)
        
        // Then
        // Confirm the view models formatting
        let viewModel = spy.viewModels.first!
        XCTAssertTrue(spy.displayReposCalled, "Display called")
        XCTAssertEqual(viewModel.name, expectedViewModel.name, "Name matched")
        XCTAssertEqual(viewModel.author, expectedViewModel.author, "Author matched")
        XCTAssertEqual(viewModel.description, expectedViewModel.description, "Description matched")
        XCTAssertEqual(viewModel.avatar, expectedViewModel.avatar, "Avatar matched")
        XCTAssertEqual(viewModel.language, expectedViewModel.language, "Language matched")
        XCTAssertEqual(viewModel.stars, expectedViewModel.stars, "Stars matched")
    }
    
    func testDisplayFailure() {
        let spy = RepositoriesDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        sut.presentFailure()
        
        // Then
        XCTAssertTrue(spy.displayFailureCalled, "Display Failure called")
        
    }
}
