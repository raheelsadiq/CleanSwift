//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

@testable import CleanSwift
import XCTest

class RepositoriesInteractorTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: RepositoriesInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupRepositoriesInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupRepositoriesInteractor() {
        sut = RepositoriesInteractor()
    }
    
    // MARK: Test doubles
    
    class RepositoriesPresentationLogicSpy: RepositoriesPresentationLogic {
        var presentReposCalled = false
        func presentRepos(response: Repositories.Models.Response) {
            presentReposCalled = true
        }
    }
    
    // MARK: Tests
    
    func testDoSomething()
    {
        // Given
        let spy = RepositoriesPresentationLogicSpy()
        sut.presenter = spy
        let request = Repositories.Models.Request()
        
        // When
        sut.fetchRepos(request: request)
        
        // Then
        XCTAssertTrue(spy.presentReposCalled, "Interactor Request is working")
    }
}
