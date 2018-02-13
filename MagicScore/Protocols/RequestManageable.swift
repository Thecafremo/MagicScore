//
//  RequestManageable.swift
//  Gymnastica
//
//  Created by Thecafremo on 6/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Alamofire
import Foundation

protocol RequestManageable {
    func performRequest(to urlString: String, withMethod method: HTTPMethod, parameters parametersDictionary: [String: Any]?, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure<Data>)
}

extension RequestManageable {
    
    //JP: To add default parameters to the protocol.
    
    func performRequest(to urlString: String, withMethod method: HTTPMethod = .get, parameters parametersDictionary: [String: Any]? = nil, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure<Data>) {
        self.performRequest(to: urlString, withMethod: method, parameters: parametersDictionary, throwingResponseCompletionClosure: throwingResponseCompletionClosure)
    }
}
