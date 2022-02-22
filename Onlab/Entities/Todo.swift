//
//  Todo.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import Foundation
import SwiftUI

struct Todo: Identifiable, Hashable, Codable {
    var id: String
    var name: String
    var description: String
    var date: String
    var isDone: Bool
}
