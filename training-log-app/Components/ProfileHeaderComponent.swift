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
    
    var body: some View {
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
                .font(.system(size: 40))
                .padding([.leading], 15)
                
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        
        
            
    }
}

struct ProfileHeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderComponent(name: .constant("empty"))
    }
}
