import Fluent
import Foundation

struct AddTasks: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        let todo1 = TaskModel(id: UUID(), title: "task 1", listID: 1)
        _ = todo1.save(on: database).transform(to: ())

        let todo2 = TaskModel(id: UUID(), title: "task 2", listID: 2)
        _ = todo2.save(on: database).transform(to: ())

        let todo3 = TaskModel(id: UUID(), title: "task 3", dueDate: Date(), listID: 3)
        _ = todo3.save(on: database).transform(to: ())

        let todo4 = TaskModel(id: UUID(), title: "task 4", priority: .high, listID: 1)
        return todo4.save(on: database).transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return TaskModel.query(on: database).delete()
    }
}
