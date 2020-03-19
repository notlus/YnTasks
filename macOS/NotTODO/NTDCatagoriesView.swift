//
//  NTDCatagoriesView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

let homeCategory = TodoCategory(name: "Home", todos: [Todo(id: 1, task: "Home one")])
let workCategory = TodoCategory(name: "Work", todos: [Todo(id: 2, task: "Work one")])
let learningCategory = TodoCategory(name: "Learning", todos: [Todo(id: 3, task: "Learn one")])

let lists = [homeCategory, workCategory, learningCategory]

final class CategoryData: ObservableObject {
    @Published var data: [TodoCategory] = lists
}

struct CategoryRow: View {
    var category: TodoCategory

    var body: some View {
        Text("\(category.name)")
            .font(.headline)
            .border(Color.black, width: 2)
    }
}

struct NTDCategoriesView: View {
    @Binding public var selectedCategory: TodoCategory?
    public var categoryData = CategoryData()

    var body: some View {
        List(selection: $selectedCategory) {
            ForEach(categoryData.data, id: \.self) { data in
                NavigationLink(destination: Text(data.name)) {
                    CategoryRow(category: data)
                }
            }
        }
        .background(Color.purple)
    }
}

struct NTDCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NTDCategoriesView(selectedCategory: .constant(nil))
    }
}
