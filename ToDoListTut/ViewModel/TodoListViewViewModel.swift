//
//  TodoListViewViewModel.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import FirebaseFirestore
import Foundation
/// ViewModel  for list of items view
/// Primary tab
class TodoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
/// Delete to list item
/// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
