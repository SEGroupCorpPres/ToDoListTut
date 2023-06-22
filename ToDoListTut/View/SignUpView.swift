//
//  SignUpView.swift
//  ToDoListTut
//
//  Created by Sulaymon O'rinov on 21/06/23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewViewModel()
    var body: some View {
        VStack {
//            Header
            HeaderView(title: "Sign Up", subtitle: "Start organizing todos", angle: -15, background: .orange)

            Form {
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled().autocapitalization(.none)
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Create Account", background: .green){
//                    Attept Sign up
                    viewModel.signUp()
                }
            }.offset(y: -50)
            Spacer()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
