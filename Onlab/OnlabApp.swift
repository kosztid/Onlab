//
//  OnlabApp.swift
//  Onlab
//
//  Created by Kosztolánczi Dominik on 2022. 02. 18..
//

import SwiftUI

@main
struct OnlabApp: App {
    @StateObject private var modelData = DataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
