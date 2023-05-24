//
//  ProfileHeaderComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct ProfileHeaderComponent: View {
    
    
    @Binding
    var name : String
    
    var onLogoutAction: (() -> Void)?
    
    @State
    var isPresented = false;
        
    
    var body: some View {
        Button {
            isPresented.toggle()
            
        } label: {
            HStack {
                ZStack {
                    Circle()
                        .fill(.blue)
                        .frame(width: 60)
                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .font(.system(size: CGFloat(30)))
                }
                Text(name)
                    .font(.system(size: 20))
                    .padding([.leading], 15)
                    .foregroundColor(.black)
                    
            }.confirmationDialog("Do you want to log out?", isPresented: $isPresented) {
                Button("Log out", role: .destructive) {
                    // SEND LOGOUT REQUEST
                    print("Logging out!!")
                    onLogoutAction?()

                    
                }
            }message: {
                Text("Do you want to log out?")
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }

        
        
        
            
    }
}


struct ProfileHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderComponent(name: .constant("empty"))
    }
}
