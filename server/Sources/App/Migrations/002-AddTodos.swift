//
//  AddTodos.swift
//  App
//
//  Created by Jeffrey Sulton on 2/2/20.
//

import Fluent

struct AddTodos: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        print("Creating todos")
        let todo1 = Todo(id: 1, title: "task 1")
        _ = todo1.save(on: database).transform(to: ())

        let todo2 = Todo(id: 2, title: "task 2")
        _ = todo2.save(on: database).transform(to: ())

        let todo3 = Todo(id: 3, title: "task 3")
        _ = todo3.save(on: database).transform(to: ())

        let todo4 = Todo(id: 4, title: "task 4")
        return todo4.save(on: database).transform(to: ())
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return Todo.query(on: database).delete()
    }
}
