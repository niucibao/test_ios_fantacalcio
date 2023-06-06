//
//  EmptyTableViewCell.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {
    
    static let identifier = "EmptyTableViewCell"
    
    static func registerNib(in tableView: UITableView) {
        let nib = UINib(nibName: "EmptyTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: EmptyTableViewCell.identifier)
    }

    @IBOutlet weak var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
