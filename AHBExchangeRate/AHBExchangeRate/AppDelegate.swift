//
//  AppDelegate.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // ✅ Add this

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // ✅ Initialize window and rootViewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController() // Replace with your VC
        window?.makeKeyAndVisible()

        return true
    }
}

