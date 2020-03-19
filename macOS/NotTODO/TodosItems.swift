//
//  TodoItems.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation
import SwiftUI

public var todoData: [TodoCategory] {
    guard let todosFile = Bundle.main.url(forResource: "todos", withExtension: "json") else {
        fatalError("Unable to find todos.json")
    }

    let data = try? Data(contentsOf: todosFile)
    let decoder = JSONDecoder()
    let todos =  try? decoder.decode([TodoCategory].self, from: data!)
    return todos!
}

final class TodoItems: ObservableObject {
    @Published var todos = todoData
}
