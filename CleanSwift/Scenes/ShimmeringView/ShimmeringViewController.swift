//
//  ShimmeringViewController.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 30/11/2020.
//

import UIKit

class ShimmeringViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var shimmeringTableView: UITableView?
    
    // MARK: - Table view data source
    var shimmerViews: Bool = false {
        didSet{
            shimmeringTableView?.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShimmerTableViewCell", for: indexPath)
        cell.startShimmering()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

class ShimmerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbView: UIView!
    @IBOutlet weak var titleView1: UIView!
    @IBOutlet weak var titleView2: UIView!
}
