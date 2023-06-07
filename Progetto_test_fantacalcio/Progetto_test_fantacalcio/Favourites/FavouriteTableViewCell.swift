//
//  FavouriteTableViewCell.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//

import UIKit

class FavouriteTableViewCell: GenericTableViewCell {
    
    static let identifier = "FavouriteTableViewCell"
    
    static func registerNib(in tableView: UITableView) {
        let nib = UINib(nibName: "FavouriteTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(player: CDPlayer) {
        self.playerName.text = player.playerName
        self.playerTeam.text = player.teamAbbrevation
        self.playerImage.imageFromServerURL(urlString: player.imageUrl ?? "")
    }
    
}
