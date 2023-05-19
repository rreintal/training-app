//
//  LineBreak.swift
//  training-log-app
//
//  Created by Richard Reintal on 22.02.2023.
//

import SwiftUI

struct LineBreak: View {
    var body: some View {
        Rectangle()
            .fill(Color(uiColor: .systemGray4))
            .frame(height: 10)
    }
}

struct LineBreak_Previews: PreviewProvider {
    static var previews: some View {
        LineBreak()
    }
}
