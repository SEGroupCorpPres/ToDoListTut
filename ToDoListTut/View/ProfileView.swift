//
//  ProfileView.swift
//  ToDoListTut
//
//  Created by Adham Rajabov on 21/06/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
//                Avatar
                if let user = viewmodel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }.navigationTitle("Profile")
        }.onAppear{
            viewmodel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(
            systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
//                Info, name, email, member since
        VStack(alignment: .leading){
            HStack{
                Text("Name: ").bold()
                Text(user.name)
            }
            .padding()
            HStack{
                Text("Email: ").bold()
                Text(user.email)
            }
                .padding()
            HStack{
                Text("Member Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
                .padding()
        }
        .padding()
//                Sign Out
        Button("Log Out"){
            viewmodel.logOut()
        }.tint(.red)
//                TLButton(title: "Log Out", background: .red){
//                    viewmodel.logOut()
//                }
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
