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
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupRepositoriesViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupRepositoriesViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "RepositoriesViewController") as? RepositoriesViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class RepositoriesBusinessLogicSpy: RepositoriesBusinessLogic {
        var fetchReposCalled = false
        
        func fetchRepos(request: Repositories.Models.Request) {
            fetchReposCalled = true
        }
    }
    
    class SpyTableView: UITableView {
        var reloadDataCalled = false
        
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldDoReposWhenViewIsLoaded() {
        // Given
        let spy = RepositoriesBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.fetchReposCalled, "viewDidLoad() should ask the interactor to fetch Repos")
    }
    
    func testDisplayRepos() {
        // Given
        let viewModels: [Repositories.Models.ViewModel] = []
        let spyTableView = SpyTableView()
        sut.reposTableView = spyTableView
        
        // When
        sut.displayRepos(viewModels: viewModels)
        
        // Then
        XCTAssertTrue(spyTableView.reloadDataCalled, "Reload not Called")
    }
    
    func testDisplayReposCount() {
        // Given
        loadView()
        let tableView = sut.reposTableView
        let viewModels: [Repositories.Models.ViewModel] = RepositoriesStore.viewModels
        
        // When
        sut.displayRepos(viewModels: viewModels)
        
        let count = sut.tableView(tableView!, numberOfRowsInSection: 0)
        // Then
        XCTAssertEqual(count, RepositoriesStore.viewModels.count)
    }
    
    func testDisplayedCells() {
        // Given
        loadView()
        let tableView = sut.reposTableView
        let viewModels: [Repositories.Models.ViewModel] = RepositoriesStore.viewModels
        let firstViewModel = viewModels[0]
        
        // When
        sut.displayRepos(viewModels: viewModels)
        let firstCell = tableView?.cellForRow(at: IndexPath(row: 0, section: 0)) as! RepositoryTableViewCell
        
        // Then
        XCTAssertEqual(firstCell.nameLabel.text, firstViewModel.name)
        XCTAssertEqual(firstCell.descriptionLabel.text, firstViewModel.description)
        XCTAssertEqual(firstCell.authorLabel.text, firstViewModel.author)
        XCTAssertEqual(firstCell.starLabel.text, firstViewModel.stars)
        XCTAssertEqual(firstCell.languageLabel.text, firstViewModel.language)
    }
}
