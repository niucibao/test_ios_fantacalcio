//
//  ListTableViewCell.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import UIKit

class ListTableViewCell: GenericTableViewCell {
    
    static let identifier = "ListTableViewCell"
    
    static func registerNib(in tableView: UITableView) {
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: ListTableViewCell.identifier)
    }
    
    @IBOutlet weak var favouriteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(player: Player) {
        self.playerName.text = player.playerName
        self.playerTeam.text = player.teamAbbreviation
        self.playerImage.imageFromServerURL(urlString: player.imageURL)
    }
    
    @IBAction func favouriteButtonDidPressed(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
}
