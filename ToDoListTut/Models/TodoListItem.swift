//
//  TodoListItem.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
