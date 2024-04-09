//
//  AuthenticationMiddleware.swift
//
//
//  Created by Anastasiya Omak on 08/04/2024.
//

import Foundation
import Vapor

struct AuthenticationMiddleware: AsyncMiddleware {
    func respond(to request: Vapor.Request, chainingTo next: any Vapor.AsyncResponder) async throws -> Vapor.Response {
        // Headers: Autorization: Bearer  EDRH121324325435VHVH666
        
        
        guard let authorization =  request.headers.bearerAuthorization else {
            throw Abort(.unauthorized)
        }
        
        print(authorization.token)
        return try await next.respond(to: request)
    }
    
    
}
