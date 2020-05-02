//
//  JSTRowView.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

struct JSTRowView: View {
    @State public var taskModel: JSTTaskModel
    @State private var showNotes = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Toggle(isOn: $taskModel.complete) {
//                        if !todo.complete {
                        TextField("What do you want to do?", text: $taskModel.title, onEditingChanged: { change in
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
//            .popover(isPresented: self.$showNotes, arrowEdge: .trailing) {
//                NotesView(todo: self.$todo)
//            }
        }
    }
}

 struct JSTRowView_Previews: PreviewProvider {
    static var previews: some View {
        JSTRowView(taskModel: JSTTaskModel(list: JSTTaskModel.ListInfo(id: 2, name: "rowview")))
    }
 }
