//
//  library.swift
//  VideoGameLibrary
//
//  Created by Cody Dubree on 9/13/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import Foundation
class Library {
    var gameArray : [Game] = [Game(title: "GTA"),Game(title: "Skyrim"),Game(title: "Fortnite"),Game(title: "Call of Duty Black Ops 2"),Game(title: "Smite")]
    
    func addGame() {
        print("Please enter the tile of the game you would like to add: ")
        var newGameTitle = readLine()
        while newGameTitle == nil || newGameTitle == "" {
            print("Invalid title. Please enter the games title")
            newGameTitle = readLine()
        }
        let newGame = Game(title: newGameTitle!)
        
        gameArray.append(newGame)
    }
    func listAvailableGames(){
        
        
        for game in gameArray {
            if game.checkedIn{
                print(game.title)
            }
        }
    }
    func removeGame() {
        for index in 0..<gameArray.count {
            print("\(index). \(gameArray[index].title)")
        }
        print("Please emter the number of the game you want to remove: ")
        var userInput = Int(readLine()!)
        let validGameIndex = Array(0..<gameArray.count)
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid Input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        gameArray.remove(at: userInput!)
    }
    func checkOutgame() {
        
        for index in 0..<gameArray.count {
            if gameArray[index].checkedIn == true {
                print("\(index). \(gameArray[index].title)")
            }
        }
        print("please enter the index of the game you wish to check out: ")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid Input. Please enter a usuable index.")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = false
        
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        gameArray[userInput!].dueDate = dueDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("The game is due on : \(dateFormatter.string(from: dueDate!))")
    }
    func checkGameIn () {
        for index in 0..<gameArray.count {
            if gameArray[index].checkedIn == false {
                print("\(index). \(gameArray[index].title)")
            }
        }
        print("Please enter the index of the game you would like to check in.")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Please enter a usuable index.")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = true
        gameArray[userInput!].dueDate = nil
        
    }
    func listUnavailableGames() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(game.title) is due on : \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
}
