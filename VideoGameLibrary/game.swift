//
//  game.swift
//  VideoGameLibrary
//
//  Created by Cody Dubree on 9/10/18.
//  Copyright © 2018 Cody Dubree. All rights reserved.
//

import Foundation
class Game {
    
    let title: String
    var checkedIn: Bool = true
    var dueDate: Date?
   
    init(title: String){
        self.title = title 
    }
    
}



