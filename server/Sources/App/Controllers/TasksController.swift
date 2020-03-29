import Fluent
import Vapor

struct TasksController {
    func getAll(req: Request) throws -> EventLoopFuture<[TaskModel]> {
        return TaskModel.query(on: req.db).all()
    }

    func index(req: Request) throws -> EventLoopFuture<View> {
        return try self.getAll(req: req)
            .flatMap { (todos: [TaskModel]) -> EventLoopFuture<View> in
                let data = ["todos": todos]
                return req.view.render("todos", data)
            }
    }

    func get(req: Request) throws -> EventLoopFuture<View> {
        return TaskModel.find(req.parameters.get("todoID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { (todo: TaskModel) -> EventLoopFuture<View> in
                req.view.render("todo", todo)
            }
    }

    func create(req: Request) throws -> EventLoopFuture<TaskModel> {
        let todo = try req.content.decode(TaskModel.self)
        return todo.save(on: req.db).map { todo }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return TaskModel.find(req.parameters.get("todoID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
