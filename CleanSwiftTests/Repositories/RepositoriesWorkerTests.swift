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
  
  // MARK: Tests
  
  func testFetchRepos()
  {
    // Given
    
    // When
    
    // Then
  }
}
