//
//  AppDelegate.swift
//  Todoey
//
//  Created by 3PL-Total on 2018/6/27.
//  Copyright © 2018年 KNA. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        do{
            _ = try Realm()
        }catch{
            print("Error initialising realm \(error)")
        }
        return true
    }

   
}

