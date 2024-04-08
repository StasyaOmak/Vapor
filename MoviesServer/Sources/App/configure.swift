import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

//    app.databases.use(.postgres(hostname: "rain.db.elephantsql.com", username: "ydnbhbro", password: "CQz5N8lhkuv0nm5Ni7wTAE8lfQqvpFis", database: "ydnbhbro", as:.psql)
    
    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "rain.db.elephantsql.com",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "ydnbhbro",
        password: Environment.get("DATABASE_PASSWORD") ?? "CQz5N8lhkuv0nm5Ni7wTAE8lfQqvpFis",
        database: Environment.get("DATABASE_NAME") ?? "ydnbhbro",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)

    app.migrations.add(CreateMoviesTableMigration())

    app.views.use(.leaf)


    // register routes
    try routes(app)
}
