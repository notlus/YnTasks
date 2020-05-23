//
//  ContentView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 2/13/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var listModel = JSTListsModel()

    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                HStack {
                    JSTListsView(listModel: listModel)
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
