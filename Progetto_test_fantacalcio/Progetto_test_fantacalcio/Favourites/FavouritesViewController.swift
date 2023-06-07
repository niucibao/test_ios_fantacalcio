//
//  FavouritesViewController.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = FavouriteViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = viewModel
        
        FavouriteTableViewCell.registerNib(in: self.tableView)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

}
