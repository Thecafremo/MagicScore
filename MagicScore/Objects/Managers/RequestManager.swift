//
//  RequestManager.swift
//  Gymnastica
//
//  Created by Thecafremo on 4/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Alamofire
import Foundation

let baseURL = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/"

class RequestManager: RequestManageable {
    
    //MARK: - Class methods.
    
    class func performRequest(to urlString: String, withMethod method: HTTPMethod, parameters parametersDictionary: [String: Any]?, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure) {
        
        Alamofire.request(urlString, method: method, parameters: parametersDictionary).responseData { (dataResponse: DataResponse<Data>) in
            
            throwingResponseCompletionClosure({ () -> Any? in
                
                if let error = dataResponse.error {
                    throw error
                }
                
                return dataResponse.value
            })
        }
    }
}
