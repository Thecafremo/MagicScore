//
//  Defines.swift
//  Gymnastica
//
//  Created by Thecafremo on 6/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

//MARK: - Closures.

typealias ThrowingReturnClosure = (() throws -> Any?)
typealias ThrowingResponseCompletionClosure = (_ throwingReturnClosure: ThrowingReturnClosure) -> Void

typealias ThrowingClosure  = (() throws -> Void)
typealias ThrowingCompletionClosure = (_ throwingClosure: ThrowingClosure) -> Void

typealias ActionClosure = () -> Void
