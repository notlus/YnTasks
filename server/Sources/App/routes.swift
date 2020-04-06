import Fluent
import Vapor

func routes(_ app: Application) throws {

    /// The default route returns all lists and their tasks
    app.get { req -> Response in
        return req.redirect(to: "api/lists")
    }

    /// A route to get the health of the app
    app.get("health") { req -> String in
        return "ok"
    }

    // MARK: Lists API routes

    let listController = ListsController()

    /// Get all lists and their tasks
    app.get("api", "lists", use: listController.getAll)

    /// Get a list by its ID
    app.get("api", "list", ":listID", use: listController.get)

    /// Create a new list
    app.post("api", "lists", use: listController.create)

    // MARK: Tasks API routes
    
    let taskController = TasksController()

    /// Get all tasks
    app.get("api", "tasks", use: taskController.getAll)

    /// Get a task by its ID
    app.get("api", "task", ":taskID", use: taskController.get)

    /// Create  task
    app.post("api", "task", use: taskController.create)

    /// Update an existing task
    app.put("api", ":taskID", use: taskController.update)

    /// Delete a task
    app.delete("api", "task", ":taskID", use: taskController.delete)
}
