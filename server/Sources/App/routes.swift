import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req -> Response in
        return req.redirect(to: "/todos")
    }

    app.get("square", ":value") { req -> String in
        guard let value = req.parameters.get("value", as: Int.self) else {
            throw Abort(.badRequest)
        }
        return "square: \(value * value)"
    }

    let listController = TODOListController()
    app.get("api", "lists", use: listController.getAll)

    let todoController = TaskController()
    app.get("todos", use: todoController.index)
    app.get("api", "todos", use: todoController.getAll)
    app.get("todo", ":todoID", use: todoController.get)
    app.post("todos", use: todoController.create)
    app.delete("todos", ":todoID", use: todoController.delete)
}
