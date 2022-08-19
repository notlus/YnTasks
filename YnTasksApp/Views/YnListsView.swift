//
//  JSTListsView.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI
import YnShared

struct YnListRow: View {
    var list: YnListModel

    var body: some View {
        HStack {
            Image(systemName: "list.bullet.circle")
                .font(.system(size: 23.0))

            Text("\(list.name)")
                .font(.system(size: 12.0))
                .foregroundColor(.gray)

            Spacer()

            Text("\(list.taskCount)")
                .font(.system(size: 13.0))
                .foregroundColor(.gray)
        }
        .padding(.leading, 0)
        .padding(.top, 0)
        .padding(.bottom, 0)
    }
}

struct YnListsView: View {
    @ObservedObject var viewModel: YnListsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            YnCardView(viewModel: YnCardViewModel(iconName: "calendar.circle", name: "All", taskCount: 0))
            Text("My Lists")
                .foregroundColor(.gray)
                .padding(.leading, 5)
                .padding(.top, 10)
            List {
                ForEach(viewModel.lists, id: \.id) { list in
                    NavigationLink(destination: YnTasksView(viewModel: YnTasksViewModel(listID: list.id, listName: list.name, tasks: list.tasks))) {
                        YnListRow(list: list)
                    }
                }
            }
            Button(action: {
                self.viewModel.lists.append(YnListModel(id: 988, name: "New List"))

            }) {
                Image(systemName: "plus.circle")
                    .font(.headline)
                    .padding(.leading, 0)
                Text("Add List")
                    .font(.system(size: 13.0))
            }
            .foregroundColor(.gray)
            .padding([.bottom, .leading], 5.0)
            .buttonStyle(.plain)
        }
    }
}

struct YnListsView_Previews: PreviewProvider {
    static var previews: some View {
        let models = [
            YnListModel(id: 1, name: "List 1", tasks: .init()),
            YnListModel(id: 1, name: "List 2", tasks: .init())
        ]
        
        let viewModel = YnListsViewModel(lists: models)
        YnListsView(viewModel: viewModel)
    }
}
