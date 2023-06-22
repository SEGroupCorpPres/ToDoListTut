//
//  ToDoListTutApp.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListTutApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
