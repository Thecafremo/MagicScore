//
//  MockRequestManager.swift
//  MagicScoreTests
//
//  Created by Thecafremo on 13/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Alamofire
import Foundation
@testable import MagicScore

class MockRequestManager: RequestManageable {
    
    //MARK: - Properties.
    
    var throwingReturnClosure :ThrowingReturnClosure<Data>!
    
    
    //MARK: - RequestManageable's.
    
    func performRequest(to urlString: String, withMethod method: HTTPMethod, parameters parametersDictionary: [String: Any]?, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure<Data>) {
        throwingResponseCompletionClosure(self.throwingReturnClosure)
    }
}
