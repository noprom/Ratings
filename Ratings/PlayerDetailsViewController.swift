//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by noprom on 15/8/22.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
   
    var player: Player?
    var game:String = "Chess"
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = game
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
    保存所填的name
    
    :param: segue  <#segue description#>
    :param: sender <#sender description#>
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: self.nameTextField.text, game: "Chess", rating: 1)
        }
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func selectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = gamePickerViewController.selectedGame {
                detailLabel.text = selectedGame
                game = selectedGame
        }
    }
}
