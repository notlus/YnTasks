import Fluent
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateLists())
    app.migrations.add(CreateTask())
    app.migrations.add(AddLists())
    app.migrations.add(AddTasks())

    // register routes
    try routes(app)
}
