//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftAWSLambdaRuntime open source project
//
// Copyright (c) 2017-2018 Apple Inc. and the SwiftAWSLambdaRuntime project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftAWSLambdaRuntime project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import AWSLambdaRuntimeCore
import NIO

// in this example we are receiving and responding with strings
struct Handler: EventLoopLambdaHandler {
    typealias In = String
    typealias Out = String

    func handle(context: Lambda.Context, payload: String) -> EventLoopFuture<String> {
        // as an example, respond with the reverse the input payload
        context.eventLoop.makeSucceededFuture(String(payload.reversed()))
    }
}

Lambda.run(Handler())

// MARK: - this can also be expressed as a closure:

/*
 Lambda.run { (_, payload: String, callback) in
   callback(.success(String(payload.reversed())))
 }
 */
