import Fluent
import Vapor

final class NTDTask: Content, Model {
    static let schema = "tasks"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Parent(key: "list_id")
    var list: NTDList

    init() {}

    init(id: UUID? = nil, title: String, listID: Int) {
        self.id = id
        self.title = title
        self.$list.id = listID
    }
}
