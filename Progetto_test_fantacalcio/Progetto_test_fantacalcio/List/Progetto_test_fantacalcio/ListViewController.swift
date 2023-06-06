//
//  ListViewController.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    var searchBar: UISearchBar!
    var viewModel = ListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar()
        searchBar.placeholder = "Cerca calciatore"
        searchBar.delegate = viewModel
        
        navigationItem.titleView = searchBar
        
        ListTableViewCell.registerNib(in: self.tableView)
        
        tableView.separatorColor = .clear

        tableView.dataSource = viewModel
        tableView.delegate = self
        
        viewModel.delegate = self
        viewModel.fetchData()
        
        emptyView.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let searchBar = searchBar else { return }
        searchBar.resignFirstResponder()
    }
    
}

extension ListViewController: ListViewModelDelegate {
    func dataShouldReload(isEmpty: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.emptyView.isHidden = !isEmpty
        }
    }
}
