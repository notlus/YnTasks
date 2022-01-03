//
//  JSTTasksView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

class YnTasksViewModel: ObservableObject {
    let listID: Int
    @Published var listName: String
    @Published var tasks: [JSTTaskModel]

    init(listID: Int, listName: String, tasks: [JSTTaskModel]) {
        self.listID = listID
        self.listName = listName
        self.tasks = tasks
    }
}

struct JSTTasksView: View {
    @ObservedObject var viewModel: YnTasksViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.viewModel.listName)
                    .font(.title)
                    .bold()
                    .padding()

                Spacer()

                VStack {
                    Button {
                        print("add")
                        viewModel.tasks.append(
                            JSTTaskModel(
                                id: UUID(),
                                list: .init(id: viewModel.listID, name: viewModel.listName)))
                    } label: {
                        Image(systemName: "plus")
                    }
                    .font(.headline)

                    Text("\(viewModel.tasks.count)")
                }
                .padding()
            }

            List {
                ForEach(viewModel.tasks, id: \.id) { _ in
                    JSTRowView(viewModel: YnRowViewModel())
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct NTDListView_Previews: PreviewProvider {
    static var previews: some View {
        let tasks = [JSTTaskModel(list: JSTTaskModel.ListInfo(id: 1, name: "task"))]
        let viewModel = YnTasksViewModel(listID: 0, listName: "Preview List", tasks: tasks)
        return JSTTasksView(viewModel: viewModel)
    }
}
