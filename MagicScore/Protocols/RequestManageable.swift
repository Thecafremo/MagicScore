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
    static func performRequest(to urlString: String, withMethod method: HTTPMethod, parameters parametersDictionary: [String: Any]?, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure)
}

extension RequestManageable {
    
    //JP: To add default paratemers to the protocol.
    
    static func performRequest(to urlString: String, withMethod method: HTTPMethod = .get, parameters parametersDictionary: [String: Any]? = nil, throwingResponseCompletionClosure: @escaping ThrowingResponseCompletionClosure) {
        self.performRequest(to: urlString, withMethod: method, parameters: parametersDictionary, throwingResponseCompletionClosure: throwingResponseCompletionClosure)
    }
}
