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
    
    class func retrieve(through requestManager: RequestManageable = RequestManager(), throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure<Credit>) {
        
        requestManager.performRequest(to: baseURL + "mockcredit/values", withMethod: .get, parameters: nil) { (responseThrowingReturnClosure: ThrowingReturnClosure<Data>) in
            
            throwingResponseCompletionClosure({ () throws -> Credit? in

                guard let data = try responseThrowingReturnClosure() else {
                    return nil
                }
                
                return try JSONDecoder().decode(Credit.self, from: data)
            })
        }
    }
}
