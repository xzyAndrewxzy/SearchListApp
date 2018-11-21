//
//  AppDelegate.swift
//  SearchListApp
//
//  Created by user145527 on 11/14/18.
//  Copyright © 2018 user145527. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print("did finish lauching with options")
        // first thing to occure even before didview method.
        // happens when app is at launch
        //ex gathering the data the should be there
    
        //shows that data was saved and exist
print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
       

        // if something happens to the phone
        // method on what should happen if the user receives a call or something
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // happens when your app is nolonger in the view, when the user leaves the app
        print("did enter into background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("app has been teriminated")
        
        // point in where you app terminated
        // user by swiping up
        // system trigged for memory reuse
    }


}

