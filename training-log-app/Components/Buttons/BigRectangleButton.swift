//
//  BigRectangleButton.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct BigRectangleButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var imageName : String = "calendar"
    var buttonContent : String = "CALENDAR"
    
    var body: some View {
        Button {
            // action
        } label: {
            HStack {
                Image(systemName: imageName).foregroundColor(whichIconColorToUse(colorScheme))
                Text(buttonContent).foregroundColor(whichTextColorToUse(colorScheme))
            }
        }.controlSize(.large)
            .foregroundColor(.black)
            .buttonStyle(.bordered)
            .tint(.secondary)
            
    }
}

func whichTextColorToUse(_ scheme : ColorScheme) -> Color {
    if (scheme == .dark) {
        return .white;
    }
    return .black
}

func whichIconColorToUse(_ scheme : ColorScheme) -> Color {
    if (scheme == .dark) {
        return .blue;
    }
    return .black
}

struct BigRectangleButton_Previews: PreviewProvider {
    static var previews: some View {
        BigRectangleButton()
    }
}
