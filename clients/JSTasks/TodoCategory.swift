//
//  TodoCategory.swift
//  NotTODO
//
//  Created by Jeffrey Sulton on 3/7/20.
//  Copyright © 2020 Jeffrey Sulton. All rights reserved.
//

import Foundation

public struct TodoCategory: Codable, Hashable, Identifiable {
    public var id: Int
    public var name: String
    public var todos = [Todo]()
}
