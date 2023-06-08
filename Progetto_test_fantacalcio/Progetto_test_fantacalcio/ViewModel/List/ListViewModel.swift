//
//  ListViewModel.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import Foundation
import UIKit

class ListViewModel: NSObject {
    
    var searchedText = ""
    private var players: [Player]?
    var filteredPlayers: [Player] = []
    var delegate: ListViewModelDelegate?
    
    var coreDataManager = CoreDataManager()
    
    func fetchData() {
        URLManager.getList { result in
            self.players = result
            
            self.players?.sort(by: { playerA, playerB in
                if playerA.teamAbbreviation != playerB.teamAbbreviation {
                    return playerA.teamAbbreviation < playerB.teamAbbreviation
                } else {
                    return playerA.playerName < playerB.playerName
                }
            })
            
            self.delegate?.dataShouldReload(isEmpty: (self.searchedText != "" && self.filteredPlayers.isEmpty))
        } onError: { error in
            
        }

    }
    
}

extension ListViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchedText != "" {
            return filteredPlayers.count
        } else {
            guard let players = players else { return 0 }
            return players.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        
        
        if searchedText != "" {
            let player = filteredPlayers[indexPath.row]
            cell.setup(player: player,
                       isFavourite: coreDataManager.isFavourite(playerId: player.playerId))
        } else if let players = players {
            let player = players[indexPath.row]
            cell.setup(player: player,
                       isFavourite: coreDataManager.isFavourite(playerId: player.playerId))
        }
        
        cell.favouriteDidPressed = favouriteDidPressed
        return cell
        
    }
    
    func favouriteDidPressed(player: Player, selected: Bool) {
        if selected {
            coreDataManager.createNewPlayer(player: player)
        } else {
            coreDataManager.deletePlayer(id: player.playerId)
        }
    }

}

extension ListViewModel: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchedText = searchText
        performSearch(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchedText = ""
        delegate?.dataShouldReload(isEmpty: (searchedText != "" && filteredPlayers.isEmpty))
    }
    
    
    func performSearch(with searchText: String) {
        guard let players = players else { return }
        filteredPlayers = players.filter({ player in
            //TESTO CONTENUTO
//            return player.playerName.lowercased().contains(searchText.lowercased())
            //TESTO INIZIALE
            return player.playerName.lowercased().hasPrefix(searchText.lowercased())
        })
        delegate?.dataShouldReload(isEmpty: (searchedText != "" && filteredPlayers.isEmpty)) 
    }
}


