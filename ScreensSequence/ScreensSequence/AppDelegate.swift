//
//  AppDelegate.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        window = UIWindow()
//        window?.rootViewController = UIViewController() /*ASSEMBLY*/
//        window?.makeKeyAndVisible()
        
//        //-------------------------------
//        let window1 = UIWindow()
//        window1.rootViewController = UIViewController()
//        window1.makeKeyAndVisible()
//
//        // vs
//
//        let view = UIView()
//        window?.addSubview(view)
//        //------------------------------------------
        /* vc -> view1
         window.rootViewController = vc
         
         
         window - subview - > view1 (vc.viewWillAppear() ....)
         window - rootVC <-> presentedVC <-> presentedVC
        */
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

