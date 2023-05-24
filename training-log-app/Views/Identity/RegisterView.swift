//
//  RegisterView.swift
//  training-log-app
//
//  Created by Richard Reintal on 18.04.2023.
//

import SwiftUI



struct RegisterView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State
    var email : String = ""
    @State
    var username : String = ""
    @State
    var firstname : String = ""
    @State
    var lastname : String = ""
    @State
    var password : String = ""
    

    @FocusState
    var isKeyboardOpen : Bool
    
    @State
    var isRegistrationSuccesful : Bool = false
    
    // BUG!!!
    // TODO
    // kui form on lahti ja submitin, siis navigeerin uuele viewile- kui vajutan back nuppu siis isKeyBoardOpen on true ja pekkis!
    
    var body: some View {
        VStack{
            VStack {
                NavigationLink("", destination: NavigationBar(), isActive: $isRegistrationSuccesful).opacity(0)
                Spacer()
                VStack {
                    Group {
                        if !isKeyboardOpen {
                            BigHeader(content: "Create account ", textColor: .white)
                        }
                    }
                   
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading], 20)
                    
                    
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                VStack {
                    IdentityInput(inputBinding: $email, placeholder: "Email", leftImageName: "envelope", isValidFunction: IdentityValidation.isValidEmail)
                    IdentityInput(inputBinding: $firstname, placeholder: "First name", leftImageName: "person", isValidFunction: IdentityValidation.isValidFirstName)
                    IdentityInput(inputBinding: $lastname, placeholder: "Last name", leftImageName: "person", isValidFunction: IdentityValidation.isValidUsername)
                    IdentityInput(inputBinding: $username, placeholder: "Username", leftImageName: "figure.run", isValidFunction: IdentityValidation.isValidUsername)
                    IdentityInput(inputBinding: $password, placeholder: "Password", leftImageName: "lock", isSecureField: true, isValidFunction: IdentityValidation.isValidPassword)
                    
                }.focused($isKeyboardOpen)
                    
                
                Spacer()
                
                VStack{
                    WideButton(
                        navigationView: LoginView(),
                        content: "Sign up",
                        backgroundColor: .blue,
                        textColor: .white,
                        isNavigationButton: false,
                        buttonFunction: {
                            let data = Register(Email: email, Password: password, FirstName: firstname, LastName: lastname, UserName: username)
                            Task {
                                let isRegistrationSuccesful = await try AppEntry.AppState.WebController.SendRegistration(registration: data)
                                if isRegistrationSuccesful {
                                    self.isRegistrationSuccesful = true
                                    AppEntry.AppState.username = data.UserName
                                    AppEntry.AppState.email = data.Email
                                    AppEntry.AppState.isLoggedIn = true
                                }
                                print(isRegistrationSuccesful)
                            }
                            })
                    
                    
                    // TEE ERALDI COMPONENT SELLEST!!
                    InputSeparator(content: "or")
                    
                    
                    WideButton(
                        navigationView: LoginView(),
                        content: "Log in",
                        backgroundColor: .white,
                        textColor: .gray,
                        borderColor: .gray) 
                    
                    
                }.padding([.leading, .trailing], 20)
                    .padding(.bottom, 30)
                
                
                
            }
            .background(
                Group {
                    if !isKeyboardOpen || isKeyboardOpen.description.isEmpty {
                        AppEntry.PrimaryBackground.mask(
                            Path { path in
                                path.move(to: CGPoint(x: -50,y: -100))
                                path.addLine(to: CGPoint(x: 0, y: 280))
                                path.addLine(to: CGPoint(x: 220, y: 170))
                                path.addLine(to: CGPoint(x: 360, y: 250))
                                path.addLine(to: CGPoint(x: 440, y: 220))
                                path.addLine(to: CGPoint(x: 440, y: -100))
                                path.closeSubpath()
                            }
                        )
                    } else {
                        Color.white
                    }
                }
            ).animation(.easeInOut(duration: 0.4))
                
                
        }
            
        
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
