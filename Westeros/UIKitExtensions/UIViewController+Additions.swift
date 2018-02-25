//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Juan Foncuberta on 13/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func wrappedInNavigation()->UINavigationController{
        return UINavigationController(rootViewController: self)
    }
}
