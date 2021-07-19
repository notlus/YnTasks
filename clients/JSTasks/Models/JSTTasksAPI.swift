//
//  JSTTasksAPI.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 4/14/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation
import SwiftUI

/// The API class for communicating with the JSTasks backend.
public final class JSTTasksAPI {
    let session: URLSession

    init() {
        session = URLSession(configuration: .default)
    }

    func getAllTasks(completionHandler: @escaping ([JSTListModel]?) -> Void) {
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
            let tasks = try? decoder.decode([JSTListModel].self, from: data)

            completionHandler(tasks)
        }
        dataTask.resume()
    }
}
