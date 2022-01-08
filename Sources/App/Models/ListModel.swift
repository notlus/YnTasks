//
//  ListModel.swift
//
//
//  Created by Jeffrey Sulton on 3/19/20.
//

import Fluent
import Vapor
import YnShared

/// Represents a TODO list and its tasks.
final class ListModel: Content, Model {
    static let schema = "lists"

    @ID(custom: "id")
    var id: Int?

    @Field(key: "name")
    var name: String

    @Children(for: \.$list)
    var tasks: [TaskModel]

    init() {}

    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

extension YnListModel: Content {}

extension YnListModel {
    init(listModel: ListModel) {
        self.init(
            id: listModel.id!,
            name: listModel.name,
            tasks: listModel.tasks.map { YnTaskModel(taskModel: $0) })
    }
}
