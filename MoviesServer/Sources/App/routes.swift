import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // http://127.0.0.1:8080
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }
    // http://127.0.0.1:8080/hello
    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("customers", ":customerId") { req async throws -> String in
        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(customerId)"
    }
    // /movies/action
    // /movies/horror
    // /movies/kids
    // /movies/abc
    // route parametrs/dynamic parameters
    // http://127.0.0.1:8080/movies/action
    app.get("movies", ":genre") { req async throws -> String in
        guard let genre = req.parameters.get("genre") else {
            throw Abort(.badRequest)
        }
        return "All movies of genre: \(genre)"
    }
    
    
    app.get("sdohni") { req async -> String in
        "Sdohni ili umri"
    }
    
    // /movies/action/2023
    app.get("movies", ":genre", ":year") { req async throws -> String in
        guard let genre = req.parameters.get("genre"),
        let year = req.parameters.get("year")
        else {
            throw Abort(.badRequest)
        }
        return "All movies of genre: \(genre) for year \(year)"
    }
    try app.register(collection: TodoController())
}
