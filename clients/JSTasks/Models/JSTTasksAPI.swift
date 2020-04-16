//
//  JSTTasksAPI.swift
//  JSTasks
//
//  Created by Jeffrey Sulton on 4/14/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation
import SwiftUI

/// Represents a list and its associated tasks.
public struct JSTList: Codable, Identifiable {
    public var id: Int
    public var name: String
    public var tasks = [JSTTaskModel]()
}

/// The API class for communicating with the JSTasks backend.
public final class JSTTasksAPI {
    let session: URLSession

    init() {
        session = URLSession(configuration: .default)
    }

    func getAllTasks(completionHandler: @escaping ([JSTList]?) -> Void) {
        let url = URL(string: "http://localhost:8080")!
        let dataTask = session.dataTask(with: url) { data, _, error in

            if let error = error {
                print("error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                fatalError("Failed to unwrap data")
            }

            let decoder = JSONDecoder()
            let tasks = try? decoder.decode([JSTList].self, from: data)

            completionHandler(tasks)
        }
        dataTask.resume()
    }
}