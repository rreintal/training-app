//
//  CreateProgram.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//

import SwiftUI

struct CreateProgram: View {
    
    @State
    var name = ""
    
    var body: some View {
        VStack {
            TextField("Enter program name", text: $name)
            Button {
                // Create program with name
            } label: {
                Text("Create program")
            }.buttonStyle(.bordered)
            
        }.textFieldStyle(.roundedBorder)
    }
}

struct CreateProgram_Previews: PreviewProvider {
    static var previews: some View {
        CreateProgram()
    }
}
