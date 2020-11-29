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
  
  override func setUp()
  {
    super.setUp()
    setupRepositoriesPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupRepositoriesPresenter()
  {
    sut = RepositoriesPresenter()
  }
  
  // MARK: Test doubles
  
  class RepositoriesDisplayLogicSpy: RepositoriesDisplayLogic
  {
    var displayReposCalled = false
    
    func displayRepos(viewModel: Repositories.Models.ViewModel)
    {
      displayReposCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentRepos()
  {
    // Given
    let spy = RepositoriesDisplayLogicSpy()
    sut.viewController = spy
    let responses: [Repositories.Models.Response] = []
    
    // When
    sut.presentRepos(response: responses)
    
    // Then
//    XCTAssertTrue(spy.displayReposCalled, "presentRepos(response:) should ask the view controller to display the result")
  }
}
