//
//  WideNavigationButton.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.04.2023.
//

import SwiftUI

struct WideButton<T: View>: View {
    
    var navigationView : T?
    
    var content : String = "Log in"
    
    var backgroundColor : Color = .blue
    
    var textColor : Color = .white
    
    var borderColor : Color = .white
    
    var isNavigationButton : Bool = true
    
    var buttonFunction : (() -> Void)?

    var body: some View {
        if(isNavigationButton) {
        NavigationLink {
            navigationView
        } label: {
            Text(content)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 2))
                .foregroundColor(textColor)
            
        }.background(backgroundColor)
            .cornerRadius(10)
        }else {
            Button {
                buttonFunction!()
            } label: {
                Text(content)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 2))
                    .foregroundColor(textColor)
                
            }.background(backgroundColor)
                .cornerRadius(10)
        }
            
    }
}

struct WideButton_Previews: PreviewProvider {
    static var previews: some View {
        WideButton(navigationView: LoginView())
    }
}
