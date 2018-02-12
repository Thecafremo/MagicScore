//
//  Populatable.swift
//  Tests
//
//  Created by Thecafremo on 15/10/17.
//  Copyright © 2017 Thecafremo. All rights reserved.
//

import Foundation

protocol Populatable {
    func populate<T>(with object:T)
}

extension Populatable {
    
    func populate<T>(with object:T) {
        print("Populatable's Default - If you ended up here, you're missing something.")
    }
}
