//
//
// Project: RSSchool_T9
//
//
// On: 23.07.21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(frame: windowScene.coordinateSpace.bounds)
               window?.windowScene = windowScene
               window?.rootViewController = rootViewControler()
               window?.makeKeyAndVisible()
        
    }
    
    func rootViewControler() -> UIViewController {
        
        let tabBarViewController = UITabBarController()
        let itemViewController = RSItemViewController()
        let settingsViewController = UINavigationController(rootViewController: SPSettinsViewController.init())
        
        
        itemViewController.tabBarItem = UITabBarItem.init(title: "Items", image: UIImage.init(systemName: "square.grid.2x2"), tag: 0)
        
        settingsViewController.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage.init(systemName: "gear"), tag: 0)
        tabBarViewController.tabBar.tintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
       
        tabBarViewController.viewControllers = [itemViewController, settingsViewController]
        
        return tabBarViewController
    }
    
}

