import Fluent

struct AddLists: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        let list1 = NTDList(name: "Home")
        _ = list1.save(on: database).transform(to: ())

        let list2 = NTDList(name: "Work")
        _ = list2.save(on: database).transform(to: ())

        let list3 = NTDList(name: "Learn")
        return list3.save(on: database).transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return NTDList.query(on: database).delete()
    }
}
