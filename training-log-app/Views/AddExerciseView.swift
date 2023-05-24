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
    
    
    @State
    var exercisesList : [ExerciseItem] = []
    
    @ObservedObject
    var newWorkout : NewWorkout
    
    // TODO:
    // kui lisad exercise workouti, siis see peaks listist kaduma!!
    
    
    var body: some View {
            VStack {
                ScrollView {
                    ForEach(exercisesList) { exerciseItem in
                        if(doesNameContainSubstring(searchBarString: searchBarInput, compareableString: exerciseItem.Name) || searchBarInput == "") {
                            AddExerciseComponent(
                                presentationMode: dismiss,
                                exerciseItem: exerciseItem,
                                workout: newWorkout)
                        }
                        
                    }
                    
                    
                    
                }.searchable(text: $searchBarInput, prompt: "Search for exercise")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 20)
            .navigationTitle("Add exercise")
            .onAppear {
                Task {
                    //exercisesList = await AppEntry.AppState.WebController.getExerciseItems()
                    exercisesList = try await AppEntry.AppState.WebController.sendRequest(
                        urlString: "http://localhost:5187/api/v1.0/Exercises/GetExerciseItems",
                        method: HTTPMethod.GET,
                        payload: nil,
                        returnType: [ExerciseItem].self)
                }
            }.onAppear{
                AppEntry.AppState.addView(view: dismiss)
            }
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
