//
//  TodoListItemViewViewModel.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//
import FirebaseAuth
import FirebaseFirestore

import Foundation
    /// ViewModel  for lsingle to do list item view (each row in itemslist)
class TodoListItemViewViewModel: ObservableObject{
    init() {
        
    }
    func toggleIsDone(item: TodoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDictionary())
    }
}
