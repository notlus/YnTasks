//
//  JSTTasksView.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2022 Jeffrey Sulton. All rights reserved.
//

import SwiftUI
import YnShared

class YnTasksViewModel: ObservableObject {
    let listID: Int
    @Published var listName: String
    @Published var tasks: [YnTaskModel]

    init(listID: Int, listName: String, tasks: [YnTaskModel]) {
        self.listID = listID
        self.listName = listName
        self.tasks = tasks
    }
}

struct YnTasksView: View {
    @ObservedObject var viewModel: YnTasksViewModel

    var body: some View {
        VStack(alignment: .leading) {
            YnTasksHeaderView(viewModel: viewModel)

            List {
                ForEach(viewModel.tasks, id: \.id) { _ in
                    YnRowView(viewModel: YnRowViewModel())
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct YnTasksView_Previews: PreviewProvider {
    static var previews: some View {
        let tasks = [
            YnTaskModel(list: YnTaskModel.ListInfo(id: 1, name: "task 1")),
            YnTaskModel(list: YnTaskModel.ListInfo(id: 2, name: "task 2"))
        ]

        let viewModel = YnTasksViewModel(listID: 0, listName: "Preview List", tasks: tasks)
        return YnTasksView(viewModel: viewModel)
    }
}
