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
typealias ThrowingResponseCompletionClosure = (ThrowingReturnClosure) -> Void

typealias ThrowingClosure  = (() throws -> Void)
typealias ThrowingCompletionClosure = (ThrowingClosure) -> Void
