//
//  FavouritesViewController.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//

import UIKit

class FavouritesViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    var viewModel = FavouriteViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = viewModel
        self.tableView.delegate = self
        
        FavouriteTableViewCell.registerNib(in: self.tableView)
        FavouritesHeaderView.registerNib(in: self.tableView)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
        self.emptyView.isHidden = !viewModel.manager.players.isEmpty
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FavouritesHeaderView.identifier) as! FavouritesHeaderView
        return header
    }

}
