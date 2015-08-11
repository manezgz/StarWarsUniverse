//
//  Constants.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 12/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import Foundation

struct Constants {
    struct Notification {
        static let UserInfoKey = "character"
        static let NotificationName = "selectedCharacter"
        static let SelectorMethod = "characterSelected:"
    }
    
    struct UserDefaults {
        static let SectionSelected = "sectionSelected"
        static let RowSelected = "rowSelected"
    }
    
    struct TableDetail {
        static let CellId = "StarWarsCell"
        static let SectionRebels = "Rebels"
        static let SectionImperials = "Imperials"
        static let title = "Star Wars Characters"
    }
    
    struct Segues {
        static let ShowDetailSB = "ShowDetailSB"
        static let showWikiSegue = "showWikiSegue"
    }

}
