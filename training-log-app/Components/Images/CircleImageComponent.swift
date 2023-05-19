//
//  CircleImageComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct CircleImageComponent: View {
    
    var imageName : String = "men1"
    
    var imageSize : CGFloat = CGFloat(70)
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: imageSize, height: imageSize)
    }
}

struct CircleImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageComponent()
    }
}
