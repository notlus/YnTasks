//
//  JSTNotesView.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 3/14/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

class YnNotesViewModel: ObservableObject {
    @Published
    var title: String

    @Published
    var notes: String

    init(title: String, notes: String) {
        self.title = title
        self.notes = notes
    }
}

struct YnNotesViewSeparator: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 50, y: 0))
            path.addLine(to: CGPoint(x: 300, y: 0))
        }
        .stroke()
        .padding()
        .frame(width: 300, height: 5)
        .border(Color.red)
    }
}

struct YnNotesView: View {
    var priorities = ["None", "High", "Medium", "Low"]
    @ObservedObject var viewModel: YnNotesViewModel
    @State private var remindOnDate = false
    @State private var remindAtLocation = false
    @State private var selectedPriority = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.title)
                .font(.headline)
                .padding()

            TextField("Notes", text: self.$viewModel.notes, onCommit: {
                print("onCommit")
            })
            .lineLimit(10)
            .multilineTextAlignment(TextAlignment.leading)
            .padding([.leading, .trailing])

            YnNotesViewSeparator()

            HStack {
                Text("remind me")
                    .frame(minWidth: 65)

                Toggle(isOn: $remindOnDate) {
                    Text("On a day")
                }
            }
            .padding()
            .border(Color.red)

            HStack {
                Text("")
                    .frame(minWidth: 65)

                Toggle(isOn: $remindAtLocation) {
                    Text("At a Location")
                }
                .padding()
            }
            .border(Color.green)

            HStack {
                Picker(selection: $selectedPriority, label: Text("priority").frame(minWidth: 65)) {
                    ForEach(0 ..< self.priorities.count) {
                        Text(self.priorities[$0])
                    }
                }
            }
            .padding()

            Spacer()
        }
        .frame(minWidth: 300, minHeight: 200)
    }
}

struct YnNotesView_Previews: PreviewProvider {
    static var previews: some View {
        YnNotesView(
            viewModel: YnNotesViewModel(
                title: "Preview Title",
                notes: "Preview Notes"))
    }
}
