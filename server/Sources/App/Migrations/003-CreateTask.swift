import Fluent

struct CreateTask: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tasks")
            .id()
            .field("title", .string, .required)
            .field("list_id", .int, .references("lists", "id"))
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("tasks").delete()
    }
}
