//
//  JSTListModel.swift
//  JSTListModel
//
//  Created by Jeffrey Sulton on 7/18/21.
//  Copyright © 2021 Jeffrey Sulton. All rights reserved.
//

import Foundation

/// Represents a list and its associated tasks.
public final class JSTListModel: Codable, Identifiable, ObservableObject {
    public var id: Int
    public var name: String
    public var tasks = [JSTTaskViewModel]()
    public var size: Int {
        self.tasks.count
    }

    init(id: Int, name: String, tasks: [JSTTaskViewModel] = []) {
        self.id = id
        self.name = name
        self.tasks = tasks
    }
}
