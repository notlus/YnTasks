//
//  JSTTaskModel.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 4/15/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation

/// A view-model describing a task.
public final class JSTTaskViewModel: Codable, ObservableObject {
    init(id: UUID = UUID(), list: ListInfo) {
        self.id = id
        self.list = list
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        complete = try container.decode(Bool.self, forKey: .complete)
        priority = try container.decode(Priority.self, forKey: .priority)
        notes = try container.decodeIfPresent(String.self, forKey: .notes) ?? ""
        dueDate = try container.decodeIfPresent(String.self, forKey: .dueDate)
        list = try container.decode(ListInfo.self, forKey: .list)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(complete, forKey: .complete)
        try container.encode(priority, forKey: .priority)
        try container.encode(notes, forKey: .notes)
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(list, forKey: .list)
    }

    var id: UUID
    var list: ListInfo

    @Published
    var title: String = ""

    @Published
    var complete: Bool = false

    @Published
    var priority: Priority = .none

    @Published
    var notes: String = ""

    @Published
    var dueDate: String?
}

extension JSTTaskViewModel {
    struct ListInfo: Codable, Hashable {
        var id: Int = 0
        var name: String? = "Default"
    }

    enum CodingKeys: CodingKey {
        case id, title, complete, priority, notes, dueDate, list
    }

    enum Priority: Int, Codable {
        case none, low, medium, high
    }
}
