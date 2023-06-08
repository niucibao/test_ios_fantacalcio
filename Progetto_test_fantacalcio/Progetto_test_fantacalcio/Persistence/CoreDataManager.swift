//
//  CoreDataManager.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 06/06/23.
//


import UIKit
import CoreData


class CoreDataManager {
    
    weak var appDelegate:AppDelegate!
    let context:NSManagedObjectContext!
    
    internal init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        self.appDelegate = appDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    var players: [CDPlayer] {
        get {
            var playert = getPlayers() ?? []
            playert.sort(by: {playerA, playerB in
                if let teamA = playerA.teamAbbrevation, let teamB = playerB.teamAbbrevation, teamA != teamB {
                    return teamA < teamB
                } else {
                    if let nameA = playerA.playerName, let nameB = playerB.playerName {
                        return nameA < nameB
                    }
                }
                return false
            })
            return playert
        }
    }
    
    //GET
    private func getPlayer(from id: Int) -> CDPlayer? {
        return getSingleElement(entityName: "CDPlayer", key: "playerId", value: id)
    }
    
    func getPlayers() -> [CDPlayer]? {
        return getAllElements(named: "CDPlayer")
    }
    
    func isFavourite(playerId: Int) -> Bool {
        let players: [CDPlayer]? = getAllElements(named: "CDPlayer")
            let player: CDPlayer? = getSingleElement(entityName: "CDPlayer", key: "playerId", value: playerId)
            return player != nil
    }
    
    //CREATE
    private func createNewPlayer(id: Int, name: String, team: String, averageGrade: Double, averageFantaGrade: Double, gamesPlayed: Int, imageUrl: String) {
        if let entity = NSEntityDescription.entity(forEntityName: "CDPlayer", in: context) {
            if getPlayer(from: id) == nil {
                if let player = NSManagedObject(entity: entity, insertInto: context) as? CDPlayer {
                    player.playerId = Int32(id)
                    player.playerName = name
                    player.teamAbbrevation = team
                    player.averageGrade = averageGrade
                    player.averageFantaGrade = averageFantaGrade
                    player.gamesPlayed = Int16(gamesPlayed)
                    player.imageUrl = imageUrl
                }
            }
        }
        saveContext()
    }
    
    func createNewPlayer(player: Player) {
        createNewPlayer(id: player.playerId,
                        name: player.playerName,
                        team: player.teamAbbreviation,
                        averageGrade: player.averageGrade,
                        averageFantaGrade: player.averageFantaGrade,
                        gamesPlayed: player.gamesPlayed,
                        imageUrl: player.imageURL)
    }
    
    //DELETE
    func deletePlayer(id: Int) {
        if let player = getPlayer(from: id) {
            context.delete(player)
        }
        saveContext()
    }
    
    //INTERNAL FUNC
    private func createNewEntity<T>(named: String) -> T? {
        if let entity = NSEntityDescription.entity(forEntityName: named, in: context) {
            if let newObject = NSManagedObject(entity: entity, insertInto: context) as? T {
                return newObject
            }
        }
        return nil
    }

    private func getElements<T>(entityName: String, key: String, value: Any) -> [T]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        if value is String {
            request.predicate = NSPredicate(format: "\(key) = '\(value)'")
        } else {
            request.predicate = NSPredicate(format: "\(key) = \(value)")
        }

        request.returnsObjectsAsFaults = false

        do {
            if let result = try context.fetch(request) as? [T] {
                if !result.isEmpty {
                    return result
                }
            }
        } catch {
            print("Qualcosa è andato storto nel get\(entityName) - \(key) = \(value)")
        }
        
        return nil
    }
    
    private func getAllElements<T>(named: String) -> [T]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: named)
        request.returnsObjectsAsFaults = false
        
        do {
            if let result = try context.fetch(request) as? [T] {
                if !result.isEmpty {
                    return result
                }
            }
        } catch {
            print("Qualcosa è andato storto nel getFilters")
        }
        
        return nil
    }

    private func getSingleElement<T>(entityName: String, key: String, value: Any) -> T? {
        return getElements(entityName: entityName, key: key, value: value)?.first
    }

    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }

}
