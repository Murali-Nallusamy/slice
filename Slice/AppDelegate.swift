//
//  AppDelegate.swift
//  Slice
//
//  Created by Murali on 22/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .green
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.navigationController.delegate = coordinator
        coordinator?.start()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }

}

