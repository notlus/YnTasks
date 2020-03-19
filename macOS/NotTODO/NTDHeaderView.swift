//
//  NTDHeaderView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct NTDHeaderView: View {
    @EnvironmentObject private var todos: TodoItems
    private var todoCount = "0"


    var body: some View {
        HStack {
            Text("TODOs")
                .font(.title)
                .bold()

            Spacer()

//            VStack {
//                Button("Add") {
//                    print("add")
////                    self.todos.todos.append(Todo(id: Int.random(in: 100..<1000), task: "New Task"))
//                }
//
//                Text("\(todos.todos.count)")
//            }
//            .padding()
        }}
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NTDHeaderView()
    }
}
