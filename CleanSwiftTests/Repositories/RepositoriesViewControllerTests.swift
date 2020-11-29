//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

@testable import CleanSwift
import XCTest

class RepositoriesViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: RepositoriesViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupRepositoriesViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupRepositoriesViewController() {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "RepositoriesViewController") as! RepositoriesViewController
  }
  
  func loadView() {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class RepositoriesBusinessLogicSpy: RepositoriesBusinessLogic {
    var fetchReposCalled = false
    
    func fetchRepos(request: Repositories.Models.Request)
    {
        fetchReposCalled = true
    }
  }
  
  // MARK: Tests
  
  func testShouldDoReposWhenViewIsLoaded()
  {
    // Given
    let spy = RepositoriesBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.fetchReposCalled, "viewDidLoad() should ask the interactor to do Repos")
  }
  
  func testDisplayRepos()
  {
    // Given
    let viewModels: [Repositories.Models.ViewModel] = []
    
    // When
    loadView()
    sut.displayRepos(viewModels: viewModels)
    
    // Then
    //XCTAssertEqual(sut.nameTextField.text, "", "displayRepos(viewModel:) should update the name text field")
  }
}
