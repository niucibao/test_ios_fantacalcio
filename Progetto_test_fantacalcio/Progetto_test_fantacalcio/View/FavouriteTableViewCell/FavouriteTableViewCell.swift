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
    
    @IBOutlet weak var playedGamesLabel: UILabel!
    @IBOutlet weak var averageGradeLabel: UILabel!
    @IBOutlet weak var averageFantaGradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(player: CDPlayer) {
        self.playerNameLabel.text = player.playerName
        self.playerTeamLabel.text = player.teamAbbrevation
        self.playerImageView.imageFromServerURL(urlString: player.imageUrl ?? "")
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        
        self.playedGamesLabel.text = formatter.string(from: NSNumber(value: player.gamesPlayed))
        self.averageGradeLabel.text = formatter.string(from: NSNumber(value:player.averageGrade))
        self.averageFantaGradeLabel.text = formatter.string(from: NSNumber(value:player.averageFantaGrade))
    }
    
}
