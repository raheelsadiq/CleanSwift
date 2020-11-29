//
//  RepositoryTableViewCell.swift
//  CleanSwift
//
//  Created by Raheel Sadiq on 29/11/2020.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!

    func configureCellWith(viewModel: Repositories.Models.ViewModel) {
        nameLabel.text = viewModel.name
        authorLabel.text = viewModel.author
        descriptionLabel.text = viewModel.description
        starLabel.text = viewModel.stars
        languageLabel.text = viewModel.language
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
