//
//  FavouritesHeaderView.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 07/06/23.
//

import UIKit

class FavouritesHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "FavouritesHeaderView"
    
    static func registerNib(in tableView: UITableView) {
        let nib = UINib(nibName: "FavouritesHeaderView", bundle: nil)
        
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: FavouritesHeaderView.identifier)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
