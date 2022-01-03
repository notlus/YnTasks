//
//  YnTasksAPI.swift
//  YnTasks
//
//  Created by Jeffrey Sulton on 4/14/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation
import SwiftUI

/// The API class for communicating with the YnTasks backend.
public final class YnTasksAPI {
    let session: URLSession

    init() {
        session = URLSession(configuration: .default)
    }

    func getAllTasks(completionHandler: @escaping ([YnListModel]?) -> Void) {
        let url = URL(string: "https://notlus.dev/api/lists")!
        let dataTask = session.dataTask(with: url) { data, _, error in

            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                fatalError("Failed to unwrap data")
            }

            let decoder = JSONDecoder()
            let tasks = try? decoder.decode([YnListModel].self, from: data)

            completionHandler(tasks)
        }
        dataTask.resume()
    }
}
