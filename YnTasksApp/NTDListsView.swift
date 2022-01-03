//
//  NTDListsView.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 3/2/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import SwiftUI

let lists = ["Home", "Work", "Learning"]

struct NTDCatagoriesView: View {
    @State private var selectedRow: Int?

    var body: some View {
        VStack(alignment: .leading) {
            Text("My Lists")
                .border(Color.orange, width: 2)
                .padding([.top, .leading])
                .font(.headline)

            List(selection: self.$selectedRow) {
                ForEach(lists, id: \.self) { item in
                    Text("\(item)")
                        .background(Color.green)
                        .font(.headline)
                        .border(Color.black, width: 2)
                }
            }
            .background(Color.purple)
        }
    }
}

struct NTDListsView_Previews: PreviewProvider {
    static var previews: some View {
        NTDCatagoriesView()
    }
}
