//
//  RootViewController.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/1/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {
    
    static func storyboardInstance() -> RootViewController? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? RootViewController
    }
}
