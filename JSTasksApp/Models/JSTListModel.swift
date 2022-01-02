//
//  JSTListModel.swift
//  JSTListModel
//
//  Created by Jeffrey Sulton on 7/18/21.
//  Copyright © 2021 Jeffrey Sulton. All rights reserved.
//

import Foundation

/// A model for a list .
///
/// A list has a name and an array of zero or more tasks.
public struct JSTListModel: Codable, Identifiable {
    public var tasks: [JSTTaskModel] = .init()
    public var id: Int
    public var name: String
    public var size: Int {
        tasks.count
    }

    init(id: Int, name: String, tasks: [JSTTaskModel] = .init()) {
        self.id = id
        self.name = name
        self.tasks = tasks
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        tasks = try container.decode([JSTTaskModel].self, forKey: .tasks)
    }

    public func encode(to _: Encoder) throws {}

    enum CodingKeys: CodingKey {
        case id, name, tasks
    }
}
