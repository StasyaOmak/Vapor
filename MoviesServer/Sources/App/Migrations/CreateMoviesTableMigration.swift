//
//  File.swift
//  
//
//  Created by Anastasiya Omak on 08/04/2024.
//

import Foundation
import Fluent

struct CreateMoviesTableMigration: AsyncMigration {
    
    func prepare(on database: any FluentKit.Database) async throws {
        // create movies table
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        // delete movies table
        try await database.schema("movies")
            .delete()
        
    }
    

    
    
}
