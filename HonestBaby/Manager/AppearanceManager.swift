//
//  AppearanceManager.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 2/27/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import Foundation
import UIKit

class AppearenceManager{
    
    
    func setupTints() {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.whiteColor()
        navigationBarAppearace.barTintColor = UIColor().teal
        
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        let windowAppearance = UIWindow.appearance()
        
        
        let tabBarAppearence = UITabBar.appearance()
        tabBarAppearence.tintColor = UIColor().teal
        tabBarAppearence.barTintColor = UIColor.whiteColor()
        
        
        
        
        
        windowAppearance.tintColor = UIColor().teal
        
        UIApplication.sharedApplication().keyWindow?.tintColor = UIColor().teal
        
        //Customize tab bar
        let tabBarItemAppearence = UIBarItem.appearance()
        
        
        
        
        
    }

}