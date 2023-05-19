//
//  IdentityInput.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.04.2023.
//

import SwiftUI

struct IdentityInput: View {
    
    
    @Binding
    var inputBinding : String
    
    var placeholder : String = "Email"
    
    var leftImageName : String = "envelope"
    
    var spacing : CGFloat = CGFloat(15)
    
    var inputTextColor : Color = .blue
    
    var isSecureField : Bool = false
    
    
    var isValidFunction : ((String) -> Bool)?
    
    @State
    var isValidationError : Bool = false
    
    var regularForegroundColor : Color = .blue
    
    var validationErrorForegroundColor : Color = .red
    
    
    
    var body: some View {
        HStack {
            Image(systemName: leftImageName)
            Group {
                if !isSecureField {
                    TextField(placeholder, text: $inputBinding).foregroundColor(isValidationError == true ? validationErrorForegroundColor : inputTextColor)
                        .onChange(of: inputBinding) { newValue in
                            if(isValidFunction != nil) {
                                if isValidFunction!(newValue) {
                                    self.isValidationError = false
                                }
                                else {
                                    isValidationError = true
                                }
                            }
                        }
                }
                else {
                    SecureField(placeholder, text: $inputBinding).foregroundColor(isValidationError == true ? validationErrorForegroundColor : inputTextColor)
                        .onChange(of: inputBinding) { newValue in
                            if(isValidFunction != nil) {
                                if isValidFunction!(newValue) {
                                    self.isValidationError = false
                                }
                                else {
                                    isValidationError = true
                                }
                            }
                        }
                }
            }
            Group {
                if !isValidationError && inputBinding != "" {
                    Image(systemName: "checkmark")
                }
                else if !isValidationError && inputBinding == "" {
                    // if view is loaded, then dont show X!
                }
                else if isValidationError && inputBinding == ""{
                    // if input is empty after first attempt
                }
                else if isValidationError && inputBinding != "" {
                    Image(systemName: "xmark")
                }
            }
            
                
        }
        .foregroundColor((isValidationError == true && inputBinding != "") == true ? validationErrorForegroundColor : regularForegroundColor)
        .overlay(
            BottomLineRectangle()
                .stroke((isValidationError == true && inputBinding != "") == true ? validationErrorForegroundColor : regularForegroundColor, lineWidth: 1)
                .offset(x: 0, y: 10)
        )
        .padding([.leading, .trailing], 30)
        .padding([.bottom, .top], spacing)
        .frame(minHeight: 40)
        
    }
}


struct BottomLineRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let bottomLineY = rect.origin.y + rect.size.height
        
        path.move(to: CGPoint(x: rect.origin.x, y: bottomLineY))
        path.addLine(to: CGPoint(x: rect.origin.x + rect.size.width, y: bottomLineY))
        
        return path
    }
}

struct IdentityInput_Previews: PreviewProvider {
    static var previews: some View {
        IdentityInput(inputBinding: .constant(""), isValidFunction: IdentityValidation.isValidEmail)
    }
}
