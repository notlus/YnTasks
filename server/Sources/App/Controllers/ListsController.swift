import Fluent
import Vapor

/// Controller to manage TODO lists
struct ListsController {
    /// Get all TODO lists and their tasks
    func getAll(req: Request) -> EventLoopFuture<[NTDList]> {
        return NTDList.query(on: req.db).with(\.$tasks).all()
    }

    /// Get a single TODO list, and its tasks
    func get(req: Request) -> EventLoopFuture<NTDList> {
        return NTDList.find(req.parameters.get("listID"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }

    /// Create a new TODO list with an empty task list
    func create(req: Request) throws -> EventLoopFuture<NTDList> {
        let newList = try req.content.decode(NTDList.self)
        return newList.save(on: req.db).map { newList }
    }
}
