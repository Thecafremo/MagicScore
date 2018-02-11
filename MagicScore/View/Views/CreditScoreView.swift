//
//  CreditScoreView.swift
//  MagicScore
//
//  Created by Thecafremo on 11/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

class CreditScoreView: UIView, NibLoadable {
    
    //MARK: - Properties.
    
    @IBOutlet weak var creditScoreCountingLabel: CountingLabel!
    @IBOutlet weak var outOfLabel: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    
    //MARK: - LifeCycle's.
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.loadNibView()
    }
}
