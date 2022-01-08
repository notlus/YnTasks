//
//  JSTListsView.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI
import YnShared

struct JSTListRow: View {
    var list: YnListModel

    var body: some View {
        HStack {
            Image("info")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20, alignment: .center)

            Text("\(list.name)")
                .font(.subheadline)

            Spacer()

            Text("\(list.size)")
                .font(.subheadline)
        }
        .padding(.leading, 0)
        .padding(.top, 0)
        .padding(.bottom, 0)
    }
}

struct YnListsView: View {
    @ObservedObject var listModel: YnListsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("My Lists")
                .padding(.leading, 5)
                .padding(.top, 10)
            List {
                ForEach(listModel.lists, id: \.id) { list in
                    NavigationLink(destination: YnTasksView(viewModel: YnTasksViewModel(listID: list.id, listName: list.name, tasks: list.tasks))) {
                        JSTListRow(list: list)
                    }
                }
            }
            Button(action: {
                self.listModel.lists.append(YnListModel(id: 988, name: "New List"))

            }) {
                Text("+")
                    .font(.headline)
                    .padding(.leading, 0)
                Text("Add List")
                    .font(.system(.footnote))
            }
        }
    }
}

struct YnListsView_Previews: PreviewProvider {
    static var previews: some View {
        YnListsView(listModel: YnListsViewModel())
    }
}
