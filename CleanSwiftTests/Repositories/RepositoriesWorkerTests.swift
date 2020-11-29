//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//


@testable import CleanSwift
import XCTest

class RepositoriesWorkerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: RepositoriesWorker!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupRepositoriesWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupRepositoriesWorker()
    {
        sut = RepositoriesWorker()
    }
    
    // MARK: Test doubles

    class APIServiceSpy: APIService {
        var executeCalled = false
        func execute(request: URLRequest, completion: @escaping (APIManager.Status) -> Void) {
            executeCalled = true
            completion(.success(nil))
        }
    }
    
    // MARK: Tests
    
    func testFetchRepos() {
        
        let apiServiceSpy = APIServiceSpy()
        sut.apiManager = APIManager(service: apiServiceSpy)
        
        // When
        let request = Repositories.Models.Request()
        sut.fetchRepos(request: request) { (_) in
        }
        
        // Then
        XCTAssertTrue(apiServiceSpy.executeCalled, "Request is made")
    }
}
