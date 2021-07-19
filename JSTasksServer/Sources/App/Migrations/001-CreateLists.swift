import Fluent

struct CreateLists: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("lists")
            .field("id", .int, .identifier(auto: true))
            .field("name", .string, .required)
            .create()
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("lists").delete()
    }

}
