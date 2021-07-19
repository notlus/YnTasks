//
//  JSTListsView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct JSTListRow: View {
    var list: JSTListModel

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

struct JSTListsView: View {
    @ObservedObject var listModel: JSTListsViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("My Lists")
                .padding(.leading, 5)
                .padding(.top, 10)
            List {
                ForEach(listModel.lists, id: \.id) { list in
                    NavigationLink(destination: JSTTasksView(list: list)) {
                        JSTListRow(list: list)
                    }
                }
            }
            Button(action: {
                self.listModel.lists.append(JSTListModel(id: 988, name: "New List"))

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

struct JSTListsView_Previews: PreviewProvider {
    static var previews: some View {
        JSTListsView(listModel: JSTListsViewModel())
    }
}
