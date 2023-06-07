//
//  GenericTableViewCell.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import UIKit

class GenericTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerImageBackground: UIView!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerTeamLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateViewLayers()
        
        selectionStyle = .none
    }
    
    private func updateViewLayers() {
        cornerView.layer.cornerRadius = 10.0
        playerImageBackground.layer.cornerRadius = playerImageBackground.frame.height / 2
    }

}
