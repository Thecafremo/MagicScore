//
//  StylingManager.swift
//  MagicScore
//
//  Created by Thecafremo on 11/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

class StylingManager {
    
    //MARK: - Methods.
    
    class func configureAppearances() {
        
        // UINavigationBar.
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.black
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
