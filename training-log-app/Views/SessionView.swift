//
//  SessionView.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import SwiftUI

struct SessionView: View {
    
    var Session : WorkoutSession
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            ForEach(Session.Exercises, id: \.self) { exercise in
                SessionViewExerciseComponent(sessionExercise: exercise)
            }
            Spacer()
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .onAppear{
                AppEntry.AppState.addView(view: dismiss)
            }
            
    }
}




struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView(Session: WorkoutSession(Name: "SessionName"))
    }
}
