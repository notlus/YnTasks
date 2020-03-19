//
//  NTDRowView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct NTDRowView: View {
    @State public var todo: Todo
    @State private var showNotes = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Toggle(isOn: $todo.complete) {
//                        if !todo.complete {
                        TextField("What do you want to do?", text: $todo.task, onEditingChanged: { change in
                            print("change: \(change)")
                        })
                            .font(.subheadline)
                    }

                    Spacer()

                    Button(action: {
                        self.showNotes.toggle()
                    }, label: {
                        Image("info")
                            .resizable()
                    })
                        .frame(width: 20, height: 20)
                        .buttonStyle(PlainButtonStyle())
                        .padding([.leading, .trailing])
                }
            }
            .popover(isPresented: self.$showNotes, arrowEdge: .trailing) {
                NotesView(todo: self.$todo)
            }
        }
    }
}

struct NTDRowView_Previews: PreviewProvider {
    static var previews: some View {
        NTDRowView(todo: todoData[0].todos[0])
    }
}
