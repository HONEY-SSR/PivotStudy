//
//  AppDelegate.swift
//  PivotStudy
//
//  Created by SSR on 2023/3/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    
        return true
    }
}
