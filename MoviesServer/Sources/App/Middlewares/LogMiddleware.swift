//
//  LogMiddleware.swift
//
//
//  Created by Anastasiya Omak on 08/04/2024.
//

import Foundation
import Vapor

struct LogMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: any AsyncResponder) async throws -> Response {
        print("LOG MIDDLEWARE")
        return try await next.respond(to: request)
    }
}
