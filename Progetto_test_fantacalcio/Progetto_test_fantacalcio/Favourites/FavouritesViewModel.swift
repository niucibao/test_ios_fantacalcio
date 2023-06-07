//
//  FavouritesViewModel.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//

import Foundation
import UIKit

class FavouriteViewModel: NSObject {
    
    let manager = CoreDataManager()
    
    
}

extension FavouriteViewModel : UITableViewDataSource {
    
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return manager.players.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell

        cell.setup(player: manager.players[indexPath.row])

        return cell
    }
    
    
}
