//
//  LoginView.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                //            Header
                HeaderView(title: "To Do List", subtitle: "Get Things done", angle: 15, background: .pink)

                //            Login Form
                
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Adress", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }.offset(y: -50)
                //            Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: SignUpView())
                }.padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
