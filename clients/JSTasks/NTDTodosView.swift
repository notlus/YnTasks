//
//  NTDTodosView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct NTDTodosView: View {
    public var listName: String
    public var todos: [Todo]
    @State private var selectedRow: Int?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.listName)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.red)
                    .padding()

                Spacer()

                VStack {
                    Button("Add") {
                        print("add")
//                        todos.append(Todo(id: Int.random(in: 100..<1000), task: "New Task"))
                    }

                    Text("\(todos.count)")
                }
                .padding()
            }

            List(selection: $selectedRow) {
                ForEach(todos) { todo in
                    NTDRowView(todo: todo)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct NTDListView_Previews: PreviewProvider {
    static var previews: some View {
        NTDTodosView(listName: "Work", todos: TodoItems().todos[0].todos)
            .environmentObject(TodoItems())
    }
}
