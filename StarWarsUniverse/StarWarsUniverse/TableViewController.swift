//
//  TableViewController.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 11/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit

protocol StarsWarsCharacterSelectedProtocolDelegate {
    func sender(sender:TableViewController, didSelectCharacter: CROCharacter)
}

class TableViewController: UITableViewController {
    
    var model:CROStarWarsModel!
    var delegate:StarsWarsCharacterSelectedProtocolDelegate!
    var selectedCharacter:CROCharacter?
    
    required init(coder aDecoder: NSCoder!){
        super.init(coder: aDecoder)
        //Creamos un objeto StarWarsUniverse y se lo calzamos
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title=Constants.TableDetail.title
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if (section == 0) {
            return Constants.TableDetail.SectionRebels
        }else{
            return Constants.TableDetail.SectionImperials
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return model!.characters.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return model!.characters[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableDetail.CellId, forIndexPath: indexPath) as! UITableViewCell

        let starWarsCharacter=model?.characters[indexPath.section][indexPath.row]
        
        cell.textLabel!.text=starWarsCharacter!.alias
        cell.detailTextLabel!.text=starWarsCharacter!.name
        cell.imageView!.image=starWarsCharacter!.photo

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let characterSelected=model.characters[indexPath.section][indexPath.row]
        //Avisamos Delegado y Notificamos
        delegate.sender(self, didSelectCharacter:characterSelected)
        let notificationCenter = NSNotificationCenter.defaultCenter()
        let dictCharacter = [Constants.Notification.UserInfoKey:characterSelected]
        notificationCenter.postNotificationName(Constants.Notification.NotificationName, object: self, userInfo: dictCharacter)
        //Guardamos en NSUsers Defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(indexPath.section, forKey: Constants.UserDefaults.SectionSelected)
        defaults.setObject(indexPath.row, forKey: Constants.UserDefaults.RowSelected)
        self.selectedCharacter=characterSelected
        
        if (self.splitViewController!.collapsed) {
            self.performSegueWithIdentifier(Constants.Segues.ShowDetailSB, sender: self)
        }
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as!DetailViewController
        detailVC.model=self.selectedCharacter
    }


}
