//
//  YnTaskModel.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 4/15/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation

/// A model for a task .
///
/// A task belongs to a single list.
public struct YnTaskModel: Codable {
    public init(id: UUID = UUID(), list: ListInfo) {
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

    public var id: UUID
    public var list: ListInfo
    var title: String = ""
    var complete: Bool = false
    var showNotes: Bool = false
    var priority: Priority = .none
    var notes: String = ""
    var dueDate: String?
}

extension YnTaskModel {
    public struct ListInfo: Codable, Hashable {
        public var id: Int = 0
        public var name: String? = "Default"
        
        public init(id: Int, name: String?) {
            self.id = id
            self.name = name
        }
    }

    enum CodingKeys: CodingKey {
        case id, title, complete, priority, notes, dueDate, list
    }

    enum Priority: Int, Codable {
        case none, low, medium, high
    }
}
