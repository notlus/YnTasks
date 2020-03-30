//
//  Todo.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation

public struct Todo: Codable, Hashable, Identifiable {
    public var id: Int
    var task: String
    var complete: Bool = false
    var notes: String = ""
//    var dueDate: Date?
}

