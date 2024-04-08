//
//  Movie.swift
//
//
//  Created by Anastasiya Omak on 08/04/2024.
//

import Foundation
import Vapor
import Fluent


final class  Movie: Model, Content {
    
static let schema: String = "movies"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
