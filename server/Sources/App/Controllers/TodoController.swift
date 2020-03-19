import Fluent
import Vapor

struct TodoController {
    func getAll(req: Request) throws -> EventLoopFuture<[Todo]> {
        return Todo.query(on: req.db).all()
    }

    func index(req: Request) throws -> EventLoopFuture<View> {
        return try self.getAll(req: req)
            .flatMap { (todos: [Todo]) -> EventLoopFuture<View> in
                let data = ["todos": todos]
                return req.view.render("todos", data)
        }
    }

    func get(req: Request) throws -> EventLoopFuture<View> {
        return Todo.find(req.parameters.get("todoID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { (todo: Todo) -> EventLoopFuture<View> in
                return req.view.render("todo", todo)
        }
    }

    func create(req: Request) throws -> EventLoopFuture<Todo> {
        let todo = try req.content.decode(Todo.self)
        return todo.save(on: req.db).map { todo }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Todo.find(req.parameters.get("todoID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
