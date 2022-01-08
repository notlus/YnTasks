import Fluent
import Vapor
import YnShared

struct TasksController {
    func getAll(req: Request) throws -> EventLoopFuture<[YnTaskModel]> {
        return TaskModel.query(on: req.db)
            .with(\.$list)
            .all()
            .flatMapThrowing {
                $0.map { YnTaskModel(taskModel: $0) }
            }
    }

    func get(req: Request) throws -> EventLoopFuture<View> {
        return TaskModel.find(req.parameters.get("taskID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { (task: TaskModel) -> EventLoopFuture<View> in
                req.view.render("task", YnTaskModel(taskModel: task))
            }
    }

    func create(req: Request) throws -> EventLoopFuture<YnTaskModel> {
        let task = try req.content.decode(TaskModel.self)
        return task.save(on: req.db).map { YnTaskModel(taskModel: task) }
    }

    /// Update an existing `TaskModel`
    func update(req: Request) throws -> EventLoopFuture<YnTaskModel> {
        let updatedTask = try req.content.decode(TaskModel.self)

        return TaskModel.query(on: req.db)
            .with(\.$list)
            .filter(\.$id == updatedTask.id!)
            .first()
            .unwrap(or: Abort(.notFound))
            .flatMap { existingTask -> EventLoopFuture<YnTaskModel> in
                existingTask.title = updatedTask.title
                existingTask.priority = updatedTask.priority
                existingTask.dueDate = updatedTask.dueDate
                existingTask.notes = updatedTask.notes

                return existingTask.update(on: req.db)
                    .map { YnTaskModel(taskModel: existingTask) }
            }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return TaskModel.find(req.parameters.get("taskID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
