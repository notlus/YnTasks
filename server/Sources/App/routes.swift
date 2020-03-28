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

    let listController = ListsController()
    app.get("api", "lists", use: listController.getAll)
    app.get("api", "list", ":listID", use: listController.get)
    app.post("api", "lists", use: listController.create)

    let taskController = TasksController()
    app.get("todos", use: taskController.index)
    app.get("api", "todos", use: taskController.getAll)
    app.get("todo", ":todoID", use: taskController.get)
    app.post("api", "todo", use: taskController.create)
    app.delete("api", "todo", ":todoID", use: taskController.delete)
}
