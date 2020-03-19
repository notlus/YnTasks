//
//  NTDCatagoriesView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var category: TodoCategory

    var body: some View {
        Text("\(category.name)")
            .font(.headline)
            .border(Color.black, width: 2)
    }
}

struct NTDCategoriesView: View {
    @EnvironmentObject private var todos: TodoItems
    @Binding public var selectedCategory: TodoCategory?

    var body: some View {
        List(selection: $selectedCategory) {
            ForEach(todos.todos) { todo in
                NavigationLink(destination: NTDTodosView(listName: todo.name, todos: todo.todos)) {
                    CategoryRow(category: todo)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(Color.yellow, width: 2)
    }
}

struct NTDCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NTDCategoriesView(selectedCategory: .constant(TodoCategory(id: 1, name: "Work")))
            .environmentObject(TodoItems())
    }
}
