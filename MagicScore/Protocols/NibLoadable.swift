//
//  NibLoadable.swift
//  SoSweat
//
//  Created by Thecafremo on 11/11/16.
//  Copyright © 2016 SoSweat Limited. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable: class {
    
    weak var view: UIView! { get set }
    
    func loadNibView()
}


extension NibLoadable where Self: UIView {
    
    //MARK: - Methods.
    
    func loadNibView() {
        
        Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil)
        
        self.addSubview(self.view)
        
        self.view.autoresizesSubviews = true
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        let viewDictionary = ["view": self.view!]
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:viewDictionary))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views:viewDictionary))
    }
}
