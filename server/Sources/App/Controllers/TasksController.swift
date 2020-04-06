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
        return TaskModel.find(req.parameters.get("taskID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { (task: TaskModel) -> EventLoopFuture<View> in
                req.view.render("task", task)
            }
    }

    func create(req: Request) throws -> EventLoopFuture<TaskModel> {
        let task = try req.content.decode(TaskModel.self)
        return task.save(on: req.db).map { task }
    }

    func update(req: Request) throws -> EventLoopFuture<TaskModel> {
        let task = try req.content.decode(TaskModel.self)
        return task.update(on: req.db).map { task }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return TaskModel.find(req.parameters.get("taskID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
