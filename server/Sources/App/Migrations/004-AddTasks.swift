import Fluent

struct AddTasks: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        print("Creating todos")
        let todo1 = NTDTask(id: UUID(), title: "task 1", listID: 1)
        _ = todo1.save(on: database).transform(to: ())

        let todo2 = NTDTask(id: UUID(), title: "task 2", listID: 2)
        _ = todo2.save(on: database).transform(to: ())

        let todo3 = NTDTask(id: UUID(), title: "task 3", listID: 3)
        _ = todo3.save(on: database).transform(to: ())

        let todo4 = NTDTask(id: UUID(), title: "task 4", listID: 1)
        return todo4.save(on: database).transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return NTDTask.query(on: database).delete()
    }
}
