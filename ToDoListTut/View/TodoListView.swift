//
//  TodoListView.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    private let userId: String
    init(userId: String) {
        self.userId = userId
//        users/<id>/todos/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    TodoListItemView(item: item).swipeActions{
                        Button("Delete"){
//                            Delete
                            viewModel.delete(id: item.id)
                        } .tint(.red)
                    }
                }.listStyle(PlainListStyle())
            }.navigationTitle("To Do List").toolbar{
                Button{
//                    Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "esyj53wXlZWfMfS8GfxH7jBsLCs1")
    }
}
