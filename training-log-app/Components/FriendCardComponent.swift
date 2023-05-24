//
//  FriendCardComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct FriendCardComponent: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var name : String = "Richard"
    var imageName : String = "person"
    
    var body: some View {
        VStack {
            ZStack {
                Circle().fill(.blue)
                    .frame(height: 110)
                if (imageName != "person") {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .font(.system(size: 40))
                }else {
                    Image(systemName: imageName)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                }
                
                
            }.padding([.top], 20)
            
            Text(name).foregroundColor(whichTextColorToUse(colorScheme)).padding([.top], 10)
            
            
            Button {
                // action
            } label: {
                Text("+ Add friend")
                    .font(.system(size: 15))
            }.buttonStyle(.borderedProminent)
                .padding([.top])
            

            Spacer()
        }.frame(width: 150, height: 240)
            .border(.gray, width: 1)
            .cornerRadius(2)
            
    }
}

struct FriendCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        FriendCardComponent()
    }
}
