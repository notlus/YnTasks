import Fluent
import Vapor

/// Controller to manage TODO lists
struct TODOListController {
    func getAll(req: Request) -> EventLoopFuture<[NTDList]> {
        return NTDList.query(on: req.db).with(\.$tasks).all()
    }

    func create(req: Request) throws -> EventLoopFuture<NTDList> {
        let newList = try req.content.decode(NTDList.self)
        return newList.save(on: req.db).map { newList }
    }
}
