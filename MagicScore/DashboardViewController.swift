//
//  ViewController.swift
//  MagicScore
//
//  Created by Thecafremo on 9/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    //MARK: - Properties.
    
    @IBOutlet private weak var creditScoreView: CreditScoreView!
    
    
    //MARK: - LifeCycle's.

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configureNavigationBar()
        self.retrieveCreditScore()
    }
    
    
    //MARK: - Methods.
    
    private func configureNavigationBar() {
        self.title = NSLocalizedString("Dashboard", comment: "")
    }
    
    
    private func retrieveCreditScore() {
        
        
    }


}

