//
//  TabbarVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class TabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        
        let homeViewController = HomeVC()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let watchViewController = WatchVC()
        watchViewController.tabBarItem = UITabBarItem(title: "Watch", image: UIImage(systemName: "play.rectangle.on.rectangle"), tag: 1)
        
        let basketViewController = BasketVC()
        basketViewController.tabBarItem = UITabBarItem(title: "Bookmark", image: UIImage(systemName: "basket"), tag: 2)
        
        let settingsViewController = SettingsVC()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 3)
        
        let tabBarList = [homeViewController, watchViewController, basketViewController, settingsViewController]
        
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }
}

