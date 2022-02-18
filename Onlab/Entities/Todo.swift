//
//  Todo.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI

struct Todo: Hashable, Codable {
    var dx: Int
    var name: String
    var description: String
    var date: Date
    var isDone: Bool = false
}
