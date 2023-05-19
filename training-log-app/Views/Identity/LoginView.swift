//
//  LoginView.swift
//  training-log-app
//
//  Created by Richard Reintal on 15.04.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State
    var email = "admin@email.ee"
    
    @State
    var password = "Pede12345."
    
    @FocusState
    var isKeyboardOpen : Bool
    
    
    // lisa appstate ka field, "logged in" vms
    @State
    var isLoginSuccesful : Bool = false
    
    @State
    var showErrorMessage : Bool = true
    
    var body: some View {
        VStack {
            
            NavigationLink("", destination: NavigationBar(), isActive: $isLoginSuccesful).opacity(0)
            
            
            VStack {
                // main container!
                Spacer()
                Spacer()
                VStack {
                    Group{
                        if !isKeyboardOpen {
                            BigHeader(content: "Welcome back 👋", textColor: .white)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                
                Spacer()
                Spacer()
                Spacer()
                
                VStack {
                    IdentityInput(inputBinding: $email,
                                  placeholder: "Email",
                                  leftImageName: "envelope",
                                  spacing: 30,
                                  isValidFunction: IdentityValidation.isValidEmail)
                    IdentityInput(inputBinding: $password,
                                  placeholder: "Password",
                                  leftImageName: "lock",
                                  isSecureField: true,
                                  isValidFunction: IdentityValidation.isValidPassword)
                }.focused($isKeyboardOpen)
                    
                
                Spacer()
                Spacer()
                
                VStack {
                    WideButton(
                        navigationView: LoginView(),
                        content: "Log in",
                        backgroundColor: .blue,
                        textColor: .white,
                        borderColor: .blue,
                        isNavigationButton: false,
                        buttonFunction:
                            {
                                var data = Login();
                                data.Email = email
                                data.Password = password
                                Task{
                                    let isLoginSuccesful = await AppEntry.AppState.WebController.SendLogin(loginData: data)
                                    if isLoginSuccesful {
                                        self.isLoginSuccesful = true   
                                    }
                                }
                                
                            }
                    )
                    InputSeparator(content: "or")
                    
                    WideButton(
                        navigationView: RegisterView(),
                        content: "Sign up",
                        backgroundColor: .white,
                        textColor: .gray,
                        borderColor: .gray
                    )
                }.padding([.leading, .trailing], 30)
                    .padding(.bottom, 30)
                    
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Group {
                        if !isKeyboardOpen {
                            AppEntry.PrimaryBackground.mask({
                        Path { p in
                            // -300 random nr, et kogu screen oleks täidetud!
                            p.move(to: CGPoint(x: -50, y: -300))
                            p.addLine(to: CGPoint(x: 0, y: 265))
                            p.addLine(to: CGPoint(x: 80, y: 320))
                            p.addLine(to: CGPoint(x: 175, y: 240))
                            p.addLine(to: CGPoint(x: 300, y: 315))
                            p.addLine(to: CGPoint(x: 600, y: 20))
                            p.addLine(to: CGPoint(x: 600, y: -300))
                        }
                    })
                        } else {
                            Color.white
                        }
                    }
                ).animation(.easeInOut(duration: 0.4))
                
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
