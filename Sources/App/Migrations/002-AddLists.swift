import Fluent

struct AddLists: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        let list1 = ListModel(name: "Home")
        _ = list1.save(on: database).transform(to: ())

        let list2 = ListModel(name: "Work")
        _ = list2.save(on: database).transform(to: ())

        let list3 = ListModel(name: "Learn")
        return list3.save(on: database).transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return ListModel.query(on: database).delete()
    }
}
