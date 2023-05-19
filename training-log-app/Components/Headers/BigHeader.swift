//
//  BigHeader.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.04.2023.
//

import SwiftUI

struct BigHeader: View {
    
    var content : String = "Application"
    
    var textColor : Color = .black
    
    var body: some View {
        Text(content)
            .font(.system(size: 32))
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .padding([.bottom], 1)
    }
}

struct BigHeader_Previews: PreviewProvider {
    static var previews: some View {
        BigHeader()
    }
}
