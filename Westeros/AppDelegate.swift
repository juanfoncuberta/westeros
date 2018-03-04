//
//  AppDelegate.swift
//  Westeros
//
//  Created by Juan Foncuberta on 8/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

@UIApplicationMain




class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var houseDetailVC: HouseDetailViewController!
    var seasonDetailVC: SeasonDetailViewController!
    var splitVC: UISplitViewController!
    var mainVC: UIViewController!


   
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
       

        //creamos los controladores(masterVC, detailVC)
        
        let seasonListVC = SeasonListViewController(model:seasons)
        let  houseListVC = HouseListTableViewController(model:houses)

        
        houseDetailVC = HouseDetailViewController(model: houseListVC.lastSelectedHouse())
         seasonDetailVC = SeasonDetailViewController(model: seasonListVC.lastSelectedSeason())
        
        //Asignamos el delegado
        

        let masterTabBarVC = UITabBarController()
        masterTabBarVC.delegate = self
        masterTabBarVC.viewControllers = [houseListVC.wrappedInNavigation(),seasonListVC.wrappedInNavigation()]
       
      
     
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            splitVC =  UISplitViewController()
            splitVC.viewControllers = [masterTabBarVC,houseDetailVC.wrappedInNavigation(),seasonDetailVC.wrappedInNavigation()]
            houseListVC.delegate = houseDetailVC
            seasonListVC.delegate = seasonDetailVC
            splitVC.preferredDisplayMode = .allVisible
            mainVC = splitVC
        }
        else if UIDevice.current.userInterfaceIdiom == .phone {
            houseListVC.delegate = houseListVC
            seasonListVC.delegate = seasonListVC
            mainVC = masterTabBarVC
//            splitVC.delegate = self
        }

        
        //asignamos al rootVC
        window?.rootViewController = mainVC
        
        return true
    }
    

}

extension AppDelegate:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if UIDevice.current.userInterfaceIdiom == .pad {
            let vc = viewController.childViewControllers[0]
     
            var detailVC = UIViewController()
            if(vc is SeasonListViewController){
                 detailVC = seasonDetailVC
            }else if(vc is HouseListTableViewController){
                 detailVC = houseDetailVC
            }

            vc.showDetailViewController(detailVC.wrappedInNavigation(), sender:self )
        }
    }

}

extension AppDelegate: UISplitViewControllerDelegate{
    func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController?{

        return splitVC.viewControllers.first!
    }

    func splitViewController(_ splitViewController:UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController)->Bool{
        return true
    }
}





