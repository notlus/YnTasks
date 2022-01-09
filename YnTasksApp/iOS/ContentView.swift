//
//  ContentView.swift
//  YnTasks iOS
//
//  Created by Jeffrey Sulton on 1/3/22.
//  Copyright © 2022 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var listModel = YnListsViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                HStack {
                    YnListsView(viewModel: listModel)
                        .listStyle(SidebarListStyle())
                }
            }
            .onAppear {
                self.listModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
