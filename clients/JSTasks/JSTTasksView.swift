//
//  JSTTasksView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct JSTTasksView: View {
    var list: JSTList

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.list.name)
                    .font(.title)
                    .bold()
                    .padding()

                Spacer()

                VStack {
                    Button("+") {
                        // TODO: Add new task
                        print("add")
//                        todos.append(Todo(id: Int.random(in: 100..<1000), task: "New Task"))
                    }
                    .font(.headline)

                    Text("\(list.tasks.count)")
                }
                .padding()
            }

//            List(selection: $selectedRow) {
            List {
                ForEach(list.tasks, id: \.id) { task in
                    JSTRowView(taskModel: task)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct NTDListView_Previews: PreviewProvider {
    static var previews: some View {
        let tasks = [JSTTaskModel(list: JSTTaskModel.ListInfo(id: 1, name: "task"))]
        return JSTTasksView(list: JSTList(id: 1, name: "preview", tasks: tasks))
    }
}
