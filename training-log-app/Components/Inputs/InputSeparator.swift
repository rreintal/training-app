//
//  InputSeparator.swift
//  training-log-app
//
//  Created by Richard Reintal on 20.04.2023.
//

import SwiftUI

struct InputSeparator: View {
    var content : String = "or"
    var textColor : Color = .gray
    var lineColor : Color = .gray
    var body: some View {
        HStack {
            BottomLineRectangle()
                .stroke(lineColor, lineWidth: 1)
                .offset(x: 0, y: -15)
            Text(content).foregroundColor(textColor)
                .font(.system(size: 18))
                .padding([.leading, .trailing], 5)
            BottomLineRectangle()
                .stroke(lineColor, lineWidth: 1)
                .offset(x: 0, y: -15)
        }.frame(maxWidth: .infinity, maxHeight: 30)
    }
}

struct InputSeparator_Previews: PreviewProvider {
    static var previews: some View {
        InputSeparator()
    }
}
