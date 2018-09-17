//
//  Menu.swift
//  VideoGameLibrary
//
//  Created by Cody Dubree on 9/11/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import Foundation

class Menu {
   let gameLibrary = Library()
    var shouldQuit = false
    
    func go() {
        
        while !shouldQuit{
            printMenu()
            var input = getInput()
            while validateInput(input) == false {
                
                printMenu()
                input = getInput()
            }
            handleInput(input)
            
        }
    }
    func validateInput(_ input: String) -> Bool {
        let validMenusOptions = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenusOptions.contains(number)
    }
    
   
    func printMenu() {
        print("""
        Video Game Library
        1 Add Game
        2 Remove Game
        3 List Available Games
        4 Check Out Game
        5 Check In Game
        6 List Checked Out Games
        7 Quit
""")
    }
    
    func handleInput(_ input: String) {
        switch input {
        case "1":
           gameLibrary.addGame()
        case "2":
            gameLibrary.removeGame()
        case"3":
          gameLibrary.listAvailableGames()
        case"4":
           gameLibrary.checkOutgame()
        case"5":
            gameLibrary.checkGameIn()
        case "6":
           gameLibrary.listUnavailableGames()
        case "7":
            printMenu()
        case "8":
           quit()
        default:
            break
            
            
        }
        
    }
    func quit() {
        
        shouldQuit = true
        print("Thanks for Using the Application")
    }
    func getInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" {
            print("Please give a valid input")
            userInput = readLine()
        }
        return userInput!
    }
}

