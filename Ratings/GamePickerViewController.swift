//
//  GamePickerViewController.swift
//  Ratings
//
//  Created by noprom on 15/8/23.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class GamePickerViewController: UITableViewController {

    var games: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        games = ["Angry Birds",
            "Chess",
            "Russian Roulette",
            "Spin the Bottle",
            "Texas Hold'em Poker",
            "Tic-Tac-Toe"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GameCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
    
}
