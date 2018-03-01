//
//  CreditReportInfo.swift
//  MagicScore
//
//  Created by Thecafremo on 10/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

struct CreditReportInfo: Decodable {
    
    //MARK: - Properties.
    
    var score: Int?
    var scoreBand: Int?
    var clientRef: String?
    
    var maxScoreValue: Int?
    var minScoreValue: Int?
}
