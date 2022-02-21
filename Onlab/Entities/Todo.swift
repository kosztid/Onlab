//
//  Todo.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI

struct Todo: Hashable, Codable {
    var name: String
    var description: String
    var date: String
    var isDone: Bool
}
