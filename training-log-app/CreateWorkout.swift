//
//  CreateWorkout.swift
//  training-log-app
//
//  Created by Richard Reintal on 16.02.2023.
//

import SwiftUI

struct CreateWorkout: View {
    
    @State
    var name = ""
    
    var body: some View {
        VStack {
            TextField("Workout name", text: $name)
            Button {
                // Tee workout selle nimega ja lisa progammile!
            } label: {
                Text("Add")
            }.buttonStyle(.bordered)

        }.textFieldStyle(.roundedBorder)
    }
}

struct CreateWorkout_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkout()
    }
}
