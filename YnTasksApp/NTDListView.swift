//
//  NTDListView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct NTDTodosListView: View {
    @EnvironmentObject private var todos: TodoItems
    @State private var data: String = "data"
    @State private var selectedRow: Int?

    var body: some View {
        VStack {
//            TextField("Enter text", text: $data)

//            NavigationView {
            List(selection: $selectedRow) {
                ForEach(todos.todos) { todo in
                    NTDRowView(todo: todo)
                }
            }
//            }

//            if !todo.complete {
//                NTDRowView(todo: todo)
//            }
        }
    }
}

struct NTDListView_Previews: PreviewProvider {
    static var previews: some View {
        NTDTodosListView()
            .environmentObject(TodoItems())
    }
}
