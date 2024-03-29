//
//  JSTRowView.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 2/16/20.
//  Copyright © 2022 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

class YnRowViewModel: ObservableObject {
    @Published
    var title: String = ""

    @Published
    var complete: Bool = false

    @Published
    var showNotes: Bool = false

    @Published
    var notes: String = ""
}

struct YnRowView: View {
    @ObservedObject var viewModel: YnRowViewModel
    @State var isHovered = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Button {
                        viewModel.complete.toggle()
                    } label: {
                        Image(
                            systemName: viewModel.complete ? "circle.circle.fill" : "circle")
                            .font(.system(size: 18.0))
                            .foregroundColor(viewModel.complete ? .blue : .gray)
                    }
                    .buttonStyle(.plain)

                    TextField("What do you want to do?", text: $viewModel.title, onEditingChanged: { change in
                        print("change: \(change)")
                    })
                    .font(.subheadline)

                    Spacer()

                    if isHovered {
                        Button(action: {
                            viewModel.showNotes.toggle()
                        }, label: {
                            Image(
                                systemName: "info.circle")
                                .font(.system(size: 14.0))
                                .foregroundColor(.blue)
                        })
                        .frame(width: 20, height: 20)
                        .buttonStyle(PlainButtonStyle())
                        .padding([.leading, .trailing])
                    }
                }
            }
            .onHover { hovered in
                isHovered = hovered
            }
            .popover(
                isPresented: $viewModel.showNotes,
                arrowEdge: .trailing) {
                    YnNotesView(
                        viewModel: YnNotesViewModel(
                            title: viewModel.title,
                            notes: viewModel.notes))
            }
        }
    }
}

struct YnRowView_Previews: PreviewProvider {
    static var previews: some View {
        YnRowView(viewModel: YnRowViewModel())

        YnRowView(viewModel: YnRowViewModel(), isHovered: true)
    }
}
