//
//  DetailViewController.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 11/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,StarsWarsCharacterSelectedProtocolDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var model:CROCharacter?
    var player:SoundPlayer!
    
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        player=SoundPlayer()
        //Creamos un objeto StarWarsUniverse y se lo calzamos
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelAndView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sender(sender: TableViewController, didSelectCharacter: CROCharacter) {
        //Recibimos el delegado
        self.model=didSelectCharacter
        self.syncModelAndView()
    }
    
    func syncModelAndView(){
        self.imageView.image=self.model?.photo
        self.title=model?.alias
    }
    
    @IBAction func playButtonAction(sender: AnyObject) {
        let modelo=self.model
        player.readFileIntoAVPlayer(modelo!.sound)
    }
    @IBAction func wikiButtonAction(sender: AnyObject) {
        self.performSegueWithIdentifier(Constants.Segues.showWikiSegue, sender: self)
    }
    

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let wikiVC = segue.destinationViewController as! WikiViewController
        wikiVC.model=self.model
    }


}
