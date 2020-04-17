//
//  JSTListsView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct JSTListRow: View {
    var list: JSTList

    var body: some View {
        Text("\(list.name)")
            .font(.headline)
            .border(Color.black, width: 2)
    }
}

struct JSTListsView: View {
    @ObservedObject var listModel: JSTListsModel

    var body: some View {
        List {
            ForEach(listModel.lists, id: \.id) { list in
                NavigationLink(destination: JSTTasksView(list: list)) {
                    JSTListRow(list: list)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(Color.yellow, width: 2)
    }
}

struct JSTListsView_Previews: PreviewProvider {
    static var previews: some View {
        JSTListsView(listModel: JSTListsModel())
    }
}
