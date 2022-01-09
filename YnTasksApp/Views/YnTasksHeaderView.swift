//
//  YnTasksHeaderView.swift
//  YnTasksApp
//
//  Created by Jeffrey Sulton on 1/8/22.
//  Copyright © 2022 Jeffrey Sulton. All rights reserved.
//

import SwiftUI
import YnShared

struct YnTasksHeaderView: View {
    @ObservedObject var viewModel: YnTasksViewModel

    var body: some View {
        HStack {
            Spacer()

            VStack {
                HStack {
                    Spacer()
                    Button {
                        viewModel.tasks.append(
                            YnTaskModel(
                                id: UUID(),
                                list: .init(id: viewModel.listID, name: viewModel.listName)))
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .font(.system(size: 18.0))
                    }
                    .buttonStyle(.plain)
                    .padding([.bottom, .trailing])
                }

                HStack {
                    Text(self.viewModel.listName)
                        .font(.system(size: 34))
                        .foregroundColor(Color.blue)
                        .bold()

                    Spacer()

                    Text("\(viewModel.tasks.count)")
                        .foregroundColor(.blue)
                        .font(.system(size: 28))
                }
                .padding(.trailing)
            }
        }
    }
}

struct TasksHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        YnTasksHeaderView(viewModel: YnTasksViewModel(listID: 0, listName: "Tasks Header", tasks: .init()))
    }
}
