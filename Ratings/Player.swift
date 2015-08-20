//
//  Player.swift
//  Ratings
//
//  Created by noprom on 15/8/20.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import Foundation
class Player: NSObject{
    var name: String
    var game: String
    var rating: Int
    
    init(name: String, game: String, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
        super.init()
    }
}
