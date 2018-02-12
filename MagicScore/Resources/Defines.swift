//
//  Defines.swift
//  Gymnastica
//
//  Created by Thecafremo on 6/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

//MARK: - Closures.

typealias ThrowingReturnClosure<T> = (() throws -> T?)
typealias ThrowingResponseCompletionClosure<T> = (_ throwingReturnClosure: ThrowingReturnClosure<T>) -> Void

typealias ThrowingClosure  = (() throws -> Void)
typealias ThrowingCompletionClosure = (_ throwingClosure: ThrowingClosure) -> Void

typealias ActionClosure = () -> Void
