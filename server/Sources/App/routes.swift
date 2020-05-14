import Fluent
import Vapor

func routes(_ app: Application) throws {

    // The default route returns all lists and their tasks
    app.get { _ -> Response in
        let html = """
            <!doctype html>
            <html lang="en">
            <head>
                <!-- Required meta tags -->
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                <!-- Bootstrap CSS -->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

                <title>Hello, world!</title>
            </head>
            <body>
                <h1>Te iubesc Roxana!</h1>

                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
            </body>
            </html>
        """

        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "text/html")
        return Response(status: .ok, headers: headers, body: .init(string: html))
    }

    // A route to get the health of the app
    app.get("health") { req -> String in
        return "ok"
    }

    // MARK: Lists API routes

    let listController = ListsController()

    // Get all lists and their tasks
    app.get("api", "lists", use: listController.getAll)

    // Get a list by its ID
    app.get("api", "list", ":listID", use: listController.get)

    // Create a new list
    app.post("api", "lists", use: listController.create)

    // MARK: Tasks API routes

    let taskController = TasksController()

    // Get all tasks
    app.get("api", "tasks", use: taskController.getAll)

    // Get a task by its ID
    app.get("api", "task", ":taskID", use: taskController.get)

    // Create  task
    app.post("api", "task", use: taskController.create)

    // Update an existing task
    app.patch("api", "task", ":taskID", use: taskController.update)

    // Delete a task
    app.delete("api", "task", ":taskID", use: taskController.delete)
}
