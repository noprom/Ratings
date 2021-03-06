//
//  PlayersViewController.swift
//  Ratings
//
//  Created by noprom on 15/8/20.
//  Copyright (c) 2015年 noprom. All rights reserved.
//

import UIKit

class PlayersViewController: UITableViewController {

    // 玩家
    var players:[Player] = playersData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    排名对应的图片
    
    :param: rating <#rating description#>
    
    :returns: <#return value description#>
    */
    func imageForRating(rating: Int) -> UIImage?{
        switch(rating){
            case 1:
                return UIImage(named: "1StarSmall")
            case 2:
                return UIImage(named: "2StarsSmall")
            case 3:
                return UIImage(named: "3StarsSmall")
            case 4:
                return UIImage(named: "4StarsSmall")
            case 5:
                return UIImage(named: "5StarsSmall")
            default:
                return nil
        }
    }
    
    /**
    从PlayerDetailsViewController 取消
    
    :param: segue <#segue description#>
    */
    @IBAction func cancelToPlayersViewController(segue: UIStoryboardSegue){
        print("从PlayerDetailsViewController 取消")
    }
    
    /**
    从PlayerDetailsViewController 保存
    
    :param: segue <#segue description#>
    */
    @IBAction func savePlayerDetail(segue: UIStoryboardSegue){
        if let playerDetailsController = segue.sourceViewController as? PlayerDetailsViewController {
            //add the new player to the players array
            players.append(playerDetailsController.player!)
            // update the tableview
            let indexPath = NSIndexPath(forRow: players.count - 1 , inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
        
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath) as! PlayerCell

        let player = players[indexPath.row] as Player
        
        // 使用原生的控件
//        cell.textLabel?.text = player.name
//        cell.detailTextLabel?.text = player.game
        
        // 使用tag来查找view
//        // 姓名
//        if let nameLabel = cell.viewWithTag(100) as? UILabel{
//            nameLabel.text = player.name
//        }
//        // 游戏
//        if let gameLabel = cell.viewWithTag(101) as? UILabel{
//            gameLabel.text = player.game
//        }
//        // 排名图片
//        if let ratingImageView = cell.viewWithTag(102) as? UIImageView{
//            ratingImageView.image = self.imageForRating(player.rating)
//        }
        // 自定义类
        
        cell.nameLabel.text = player.name
        cell.gameLabel.text = player.game
        cell.ratingImageView.image = self.imageForRating(player.rating)
        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
