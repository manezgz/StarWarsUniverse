//
//  AppDelegate.swift
//  StarWarsUniverse
//
//  Created by Jose Manuel Franco on 10/8/15.
//  Copyright (c) 2015 Jose Manuel Franco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let splitVC = self.window!.rootViewController as! UISplitViewController
        var navVC = splitVC.viewControllers.first as! UINavigationController
        var navVC2 = splitVC.viewControllers.last as! UINavigationController
        var detailVC = navVC2.topViewController as! DetailViewController
        var tableVC=navVC.topViewController as! TableViewController
        
        
        
        detailVC.navigationItem.leftItemsSupplementBackButton = true
        detailVC.navigationItem.leftBarButtonItems = [splitVC.displayModeButtonItem()]
        
        //Inicializamos modelos y asignamos delegados
        
        tableVC.model=CROStarWarsModel()
        tableVC.delegate=detailVC
        
        //Comprobamos si hay algo en NSUsersDefault y cargamos el dato
        let defaults = NSUserDefaults.standardUserDefaults()
        if let value = defaults .objectForKey(Constants.UserDefaults.SectionSelected) as? Int {
            let section :Int! = defaults .objectForKey(Constants.UserDefaults.SectionSelected) as! Int
            let row :Int! = defaults.objectForKey(Constants.UserDefaults.RowSelected) as! Int
            let character=tableVC.model.characters[section][row] as CROCharacter
            detailVC.model=character
        }else{
            //Pillamos el primero de los rebeldes por defecto
            let character=tableVC.model.characters[0][0] as CROCharacter
            detailVC.model=character
        }
        
        
        //secondView.model=CROStarWarsModel()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

