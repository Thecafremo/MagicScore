//
//  CreditReportInfoAPI.swift
//  MagicScore
//
//  Created by Thecafremo on 10/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

class CreditAPI {
    
    //MARK: - Class Methods.
    
    class func retrieve(through requestManager: RequestManageable.Type = RequestManager.self, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure) {
        
        requestManager.performRequest(to: baseURL + "mockcredit/values", withMethod: .get, parameters: nil) { (responseThrowingReturnClosure: ThrowingReturnClosure) in
            
            throwingResponseCompletionClosure({ () throws -> Any? in

                guard let data = try responseThrowingReturnClosure() as? Data else {
                    return nil
                }
                
                return try JSONDecoder().decode(Credit.self, from: data)
            })
        }
    }
}
