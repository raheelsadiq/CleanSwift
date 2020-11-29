//
//  RepositoriesInteractor.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

@objc protocol RepositoriesRoutingLogic {
    
}

protocol RepositoriesDataPassing {
    var dataStore: RepositoriesDataStore? { get }
}

class RepositoriesRouter: NSObject, RepositoriesRoutingLogic, RepositoriesDataPassing {
    weak var viewController: RepositoriesViewController?
    var dataStore: RepositoriesDataStore?
    
}
