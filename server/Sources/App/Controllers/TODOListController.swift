import Fluent
import Vapor

/// Controller to manage TODO lists
struct TODOListController {
    func getAll(req: Request) -> EventLoopFuture<[NTDList]> {

        return NTDList.query(on: req.db).with(\.$tasks).all()
    }
}
