//
//  RepositoryTableViewCell.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit
import AlamofireImage

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var bottomStackView: UIStackView!

    func configureCellWith(viewModel: Repositories.Models.ViewModel) {
        
        nameLabel.text = viewModel.name
        authorLabel.text = viewModel.author
        descriptionLabel.text = viewModel.description
        starLabel.text = viewModel.stars
        languageLabel.text = viewModel.language
        
        if let url = viewModel.avatar {
            avatarImageView.af.setImage(withURL: url)
        }
        
        descriptionLabel.isHidden = !viewModel.isExpanded
        bottomStackView.isHidden = !viewModel.isExpanded
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
}
