import Fluent
import Vapor
import YnShared

/// Controller to manage TODO lists
struct ListsController {
    /// Get all `YnListModel`s and their tasks
    func getAll(req: Request) -> EventLoopFuture<[YnListModel]> {
        return ListModel
            .query(on: req.db)
            .with(\.$tasks)
            .all()
            .flatMapThrowing {
                $0.map { YnListModel(listModel: $0) }
            }
    }

    /// Get the `YnTaskModel`s for the specified `YnListModel`
    func get(req: Request) -> EventLoopFuture<[YnTaskModel]> {
        return ListModel.find(req.parameters.get("listID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.$tasks
                    .query(on: req.db)
                    .all()
                    .flatMapThrowing {
                        $0.map { YnTaskModel(taskModel: $0) }
                    }
            }
    }

    /// Create a new `YnListModel`
    func create(req: Request) throws -> EventLoopFuture<YnListModel> {
        let newList = try req.content.decode(ListModel.self)
        return newList.save(on: req.db).map { YnListModel(listModel: newList) }
    }
}
