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
        XCTAssertTrue(spy.displayReposCalled, "Display not called")
    }
    
    func testViewModelsData() {
        // Given
        let spy = RepositoriesDisplayLogicSpy()
        sut.viewController = spy
        
        let repo = RepositoriesStore.sampleRepo
        
        // Expected view model of the example repo above
        let expectedViewModel = RepositoriesStore.sampleViewModel
        
        let response = Repositories.Models.Response(repos: [repo])
        // When
        sut.present(response: response)
        
        // Then
        // Confirm the view models formatting
        let viewModel = spy.viewModels.first!
        XCTAssertTrue(spy.displayReposCalled)
        XCTAssertEqual(viewModel.name, expectedViewModel.name)
        XCTAssertEqual(viewModel.author, expectedViewModel.author)
        XCTAssertEqual(viewModel.description, expectedViewModel.description)
        XCTAssertEqual(viewModel.avatar, expectedViewModel.avatar)
        XCTAssertEqual(viewModel.language, expectedViewModel.language)
        XCTAssertEqual(viewModel.stars, expectedViewModel.stars)
    }
    
    func testDisplayFailure() {
        let spy = RepositoriesDisplayLogicSpy()
        sut.viewController = spy
        
        // When
        sut.presentFailure()
        
        // Then
        XCTAssertTrue(spy.displayFailureCalled, "Display Failure not called")
    }
}
