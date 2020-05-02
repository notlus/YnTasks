import Fluent
import Vapor

final class TaskModel: Content, Model {
    static let schema = "tasks"

    enum Priority: Int, Codable {
        case none, low, medium, high
    }

    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String

    @Field(key: "priority")
    var priority: Priority

    @Field(key: "notes")
    var notes: String?

    @Field(key: "due")
    var dueDate: Date?

    @Field(key: "complete")
    var complete: Bool
    
    @Parent(key: "list_id")
    var list: ListModel

    init() {}

    init(id: UUID? = nil, title: String, priority: Priority = .none, notes: String? = nil, dueDate: Date? = nil, complete: Bool = false, listID: Int) {
        self.id = id
        self.title = title
        self.priority = priority
        self.notes = notes
        self.dueDate = dueDate
        self.complete = complete
        self.$list.id = listID
    }
}
