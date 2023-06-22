//
//  ContentView.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
//           Is Signed In
           accountView

        }else {
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            TodoListView(userId: viewModel.currentUserId).tabItem{
                Label("Home", systemImage: "house")
            }
            ProfileView().tabItem{
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
