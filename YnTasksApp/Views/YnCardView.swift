//
//  YnCardView.swift
//  YnTasksApp
//
//  Created by Jeffrey Sulton on 1/9/22.
//  Copyright © 2022 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

class YnCardViewModel: ObservableObject {
    let iconName: String
    let name: String
    let taskCount: Int

    init(iconName: String, name: String, taskCount: Int) {
        self.iconName = iconName
        self.name = name
        self.taskCount = taskCount
    }
}

struct YnCardView: View {
    @ObservedObject var viewModel: YnCardViewModel
    let cardPrimaryColor: Color = .red
    let cardBackgroundColor: Color = .gray
    let cardTextColor: Color = .white

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .inset(by: 3)
                .fill(cardBackgroundColor)
                .frame(width: 120, height: 75 - 3.5, alignment: .leading)
                .cornerRadius(15.0)

            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: viewModel.iconName)
                        .foregroundColor(cardTextColor)
                    Spacer()
                    Text("\(viewModel.taskCount)")
                }
                .padding(.bottom, 5)
                Text(viewModel.name)
            }
            .foregroundColor(cardTextColor)
            .frame(width: 90, height: 75, alignment: .leading)
        }
    }
}

struct YnCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            YnCardView(viewModel: YnCardViewModel(iconName: "calendar.circle.fill", name: "All", taskCount: 5))
            YnCardView(viewModel: YnCardViewModel(iconName: "flag.fill", name: "Flagged", taskCount: 1))
//                .colorScheme(.dark)
        }
    }
}
