//
//  CROCharacter.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 11/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit

class CROCharacter: NSObject {
    var name:String
    var alias:String
    var wikiURL:NSURL
    var photo:UIImage
    var sound:NSURL
    
    init(name:String,alias:String,wikiURL:NSURL,photo:UIImage,sound:NSURL){
        self.name=name
        self.alias=alias
        self.wikiURL=wikiURL;
        //self.soundData=soundData
        self.photo=photo
        self.sound = sound
    }
    
   
}
