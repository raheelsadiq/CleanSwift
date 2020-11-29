//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

protocol RepositoriesDisplayLogic: class {
    func displayRepos(viewModels: [Repositories.Models.ViewModel])
    func displayFailure()
}

class RepositoriesViewController: UIViewController, RepositoriesDisplayLogic {
    
    //MAKR: - IBOutlets
    var repos: [Repositories.Models.ViewModel] = [] {
        didSet{
            reposTableView.reloadData()
        }
    }
    @IBOutlet weak var reposTableView: UITableView!
    
    var interactor: RepositoriesBusinessLogic?
    var router: (NSObjectProtocol & RepositoriesRoutingLogic & RepositoriesDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = RepositoriesInteractor()
        let presenter = RepositoriesPresenter()
        let router = RepositoriesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRepos()
    }
    
    // MARK: - Request
    
    func fetchRepos() {
        let request = Repositories.Models.Request()
        interactor?.fetchRepos(request: request)
    }
    
    // MARK: - Display
    
    func displayRepos(viewModels: [Repositories.Models.ViewModel]) {
        repos = viewModels
    }
    
    func displayFailure() {
        
    }
}

extension RepositoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell") as! RepositoryTableViewCell
        
        let viewModel = repos[indexPath.row]
        cell.configureCellWith(viewModel: viewModel)
        
        return cell
    }
}
