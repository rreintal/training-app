//
//  AddExerciseView.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.dismiss) private var dismiss
    
    
    @State
    var searchBarInput = ""
    
    
    var exercisesList : [ExerciseItem] = AppEntry.AppState.exerciseItems
    
    // siin oli state
    @ObservedObject
    var newWorkout : NewWorkout
    
    
    
    var body: some View {
        //NavigationView {
            VStack {
                ScrollView {
                    /*
                     ForEach(exercises, id: \.self) { exercise in
                         if(doesNameContainSubstring(searchBarString: searchBarInput, compareableString: exercise) || searchBarInput == "") {
                             AddExerciseComponent(exerciseName: exercise, presentationMode: dismiss, workoutExercises: $workoutExercisesList)
                         }
                     }
                     */
                    ForEach(exercisesList) { exerciseItem in
                        AddExerciseComponent(
                            presentationMode: dismiss,
                            exerciseItem: exerciseItem,
                            workout: newWorkout)
                    }
                    
                    
                    
                }.searchable(text: $searchBarInput, prompt: "Search for exercise")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 20)
            .navigationTitle("Add exercise")
            
        //}.navigationTitle("Add exercise")
        //.navigationBarTitleDisplayMode(.inline)
    }
    
    
    func doesNameContainSubstring(searchBarString: String, compareableString: String) -> Bool {
        let lowercasedSearchBarString = searchBarString.lowercased()
        let lowercasedCompareableString = compareableString.lowercased()
        
        return lowercasedCompareableString.contains(lowercasedSearchBarString)
    }
                        
}
                        
                        

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView(newWorkout: NewWorkout(AppUserId: UUID(), Name: "Aaa"))
    }
}
