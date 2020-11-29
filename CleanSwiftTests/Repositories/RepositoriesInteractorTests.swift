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
        
        func presentRepos(response: [Repositories.Models.Response]) {
            presentReposCalled = true
        }
        
        func presentFailure() {
            presentReposCalled = false
        }
    }
    
    class RepositoriesWorkerSpy: RepositoriesWorker {
        override func fetchRepos(request: Repositories.Models.Request, completion: @escaping ((APIManager.Status) -> Void)) {
            completion(.success(nil))
        }
    }
    
    // MARK: Tests
    
    func testFetchRepos() {
        // Given
        let presenterSpy = RepositoriesPresentationLogicSpy()
        sut.presenter = presenterSpy
        let workerSpy = RepositoriesWorkerSpy()
        sut.worker = workerSpy
        
        
        // When
        let request = Repositories.Models.Request()
        sut.fetchRepos(request: request)
        
        // Then
        XCTAssertTrue(presenterSpy.presentReposCalled, "Interactor Request is working")
    }
}
