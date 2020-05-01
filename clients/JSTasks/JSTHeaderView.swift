//
//  JSTHeaderView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct JSTHeaderView: View {
    @ObservedObject var tasks: JSTList

    var body: some View {
        HStack {
            Text("TODOs")
                .font(.title)
                .bold()

            Spacer()

            VStack {
                Button("Add") {
                    print("add")
                    let newTask = JSTTaskModel(list: JSTTaskModel.ListInfo())
                    self.tasks.tasks.append(newTask)
                }
                Text("\(tasks.tasks.count)")
            }
            .padding()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        JSTHeaderView(tasks: JSTList(id: 0, name: "HeaderView"))
    }
}
