//
//  ContentView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 2/13/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var todos: TodoItems
    @State private var selectedCategory: TodoCategory?

    var body: some View {
        VStack(alignment: .leading) {
            NTDHeaderView()
                .padding()
                .border(Color.orange, width: 2)

            NavigationView {
                HStack {
                    NTDCategoriesView(selectedCategory: $selectedCategory)
                        .listStyle(SidebarListStyle())
                        .border(Color.red, width: 2)

                }
            }
            .border(Color.blue, width: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoItems())
    }
}
