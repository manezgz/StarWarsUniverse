//
//  CROStarWarsModel.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 11/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit

class CROStarWarsModel: NSObject {
    
    var characters:[[CROCharacter]]
    
    var rebels:[CROCharacter]
    var imperials:[CROCharacter]
    
    override init(){
        //Init arrayImperials
        imperials=[CROCharacter]()
        rebels=[CROCharacter]()
        characters=[[CROCharacter]]()
        
        // Vader
        var imageVader = UIImage(named: "vader")
        var urlVader: NSURL = NSURL(string: "http://en.wikipedia.org/wiki/Darth_Vader")!
        let soundVader:NSURL = NSBundle.mainBundle().URLForResource("vader", withExtension:"caf")!
        let vader=CROCharacter(name: "Anakin Skywalker", alias: "Darth Vader",wikiURL: urlVader,photo: imageVader!,sound:soundVader)
        imperials.insert(vader, atIndex: 0);
        
        // Tarkin
        var imageTarkin = UIImage(named: "tarkin")
        var urlTarkin: NSURL = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin")!
        var soundTarkin:NSURL = NSBundle.mainBundle().URLForResource("tarkin", withExtension:"caf")!
        
        let tarkin=CROCharacter(name: "Wilhuf Tarkin", alias: "Grand Moff Tarkin",wikiURL: urlTarkin,photo: imageTarkin!,sound:soundTarkin)
        imperials.insert(tarkin, atIndex: 1);
        
        
        //Palpatine
        var imagePalpatine = UIImage(named: "palpatine")
        var urlPalpatine: NSURL = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine")!
        var soundPalpatine:NSURL = NSBundle.mainBundle().URLForResource("palpatine", withExtension:"caf")!
        
        let palpatine=CROCharacter(name:"Palpatine", alias: "Darth Sidious",wikiURL: urlPalpatine, photo: imagePalpatine!,sound:soundPalpatine)
        
        imperials.insert(palpatine, atIndex: 2);
        
        
        //Chewbacca
        var imageChewbacca = UIImage(named: "chewbacca")
        var urlChewbacca: NSURL = NSURL(string: "http://en.wikipedia.org/wiki/Chewbacca")!
        var soundChewbacca:NSURL = NSBundle.mainBundle().URLForResource("chewbacca", withExtension:"caf")!
        
        let chewbacca=CROCharacter(name: "", alias: "Chewbacca",wikiURL: urlChewbacca,photo: imageChewbacca!,sound:soundChewbacca)
        rebels.insert(chewbacca, atIndex:0);
        
        
        //c3po
        var imageC3po = UIImage(named: "c3po")
        var urlc3po: NSURL = NSURL(string: "http://en.wikipedia.org/wiki/C-3PO")!
        var soundc3po:NSURL = NSBundle.mainBundle().URLForResource("c3po", withExtension:"caf")!
        
        let c3po=CROCharacter(name: "", alias: "C-3PO",wikiURL: urlc3po,photo: imageC3po!,sound:soundc3po)
        rebels.insert(c3po, atIndex:1);
        
        //yoda
        var imageYoda = UIImage(named: "yoda")
        var urlYoda: NSURL = NSURL(string: "http://en.wikipedia.org/wiki/Yoda")!
        var soundYoda:NSURL = NSBundle.mainBundle().URLForResource("yoda", withExtension:"caf")!
        
        let yoda=CROCharacter(name: "Minch Yoda", alias: "Master Yoda",wikiURL: urlYoda,photo: imageYoda!,sound:soundYoda)
        rebels.insert(yoda, atIndex:2)
        characters.insert(rebels,atIndex: 0)
        characters.insert(imperials, atIndex:1)
        
    }
   
}
