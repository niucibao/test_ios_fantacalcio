//
//  ListTableViewController.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var viewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Cerca calciatore"
//        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
        
        ListTableViewCell.registerNib(in: self.tableView)
        
        tableView.separatorColor = .clear
        
        tableView.dataSource = viewModel
        
        
    }
}

extension ListTableViewController: ListViewModelDelegate {
    func dataShouldReload() {
        self.tableView.reloadData()
    }
}

extension ListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            performSearch(with: searchText)
        }
        searchBar.resignFirstResponder() // Chiudi la tastiera
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Esegui azioni di annullamento ricerca qui
        searchBar.resignFirstResponder() // Chiudi la tastiera
    }
    
    
    func performSearch(with searchText: String) {
        // Esegui la logica di ricerca qui
    }
}
