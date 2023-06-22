//
//  User.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import Foundation

struct User:Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
