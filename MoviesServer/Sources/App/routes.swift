import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    // create movie
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        try await movie.save(on: req.db)
        return movie 
    }
    
    //get all movies
    app.get("movies") { req async throws in
       try await Movie.query(on: req.db)
            .all()
    }
    
    // get movie by id
    app.get("movies", ":id") { req async throws in
       guard let movie =  try await Movie.find(req.parameters.get("id"), on: req.db) else {
           throw Abort(.badRequest)
            
        }
        return movie
        
    }
    
    
    /*
     
    
    app.middleware.use(LogMiddleware())
    
    // /members
    app.grouped(AuthenticationMiddleware()).group("members") { route  in
        route.get { req async -> String in
          return "Members Index"
        }
        route.get("hello") { req async -> String in
            return "Members hello"
        }
    }
     */
    
    /*
    // /
    app.get { req async in
    "It works"
    }
    // /hello
    app.get("hello") { req async -> String in
    "Hello, world!"
    }
    */
    /*
    // способ настройки контроллера
    try app.register(collection: MoviesController())
    
    // /movies
    // /movies/12
    
    // /users
    // /users/premium
    
    let movies = app.grouped("movies")
    
    // /movies
    movies.get { req async -> String in
    return "Movies"
    }
    
    // /movies/34
    movies.get(":movieId") { req async throws -> String in
        guard let movieId = req.parameters.get("movieId") else {
            throw Abort(.badRequest)
        }
        return "MovieId = \(movieId)"
    }
    
    let users = app.grouped("users")
    
    // /user/premium
    users.get("premium") { req async throws -> String in
        return "Premium"
        }

    
    // http://127.0.0.1:8080
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }
    // http://127.0.0.1:8080/hello
    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    // /hotels?sort=desc&search=houston
    app.get("hotels") { req async throws in
        let hotelQuery = try req.query.decode(HotelQuery.self)
        print(hotelQuery)
        return hotelQuery
    }
    
    
    
    /*
    //создаём post запрос
    app.post("movies") { req async throws in
        let movie = try req.content.decode(Movie.self)
        return movie
    }
    app.get("customers", ":customerId") { req async throws -> String in
        guard let customerId = req.parameters.get("customerId", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "\(customerId)"
    }
    
// /movies
    app.get("movies") { red async in
        [Movie(title: "Batman", year: 2023), Movie(title: "Superman", year: 2022), Movie(title: "Spiderman", year: 1999)]
        
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
     */
     */
}
