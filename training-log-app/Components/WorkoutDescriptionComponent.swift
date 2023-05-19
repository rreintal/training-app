//
//  WorkoutDescriptionComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 01.05.2023.
//

import SwiftUI

struct WorkoutDescriptionComponent<T: View>: View {
    @State
    var isPresented : Bool = false;
    
    var navigationView : T?
    
    var workoutName : String = "Push"
    
    var exercisesList : [String] = ["Bench press", "Shoulder press", "Incline bench press"]
    
    var body: some View {
        VStack {
            HStack {
                Text(workoutName)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Spacer()
                
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.blue)
                }.confirmationDialog(
                    "Are you sure?", isPresented: $isPresented)
                {
                    Button("Delete workout", role: .destructive) {
                            // action - delete workout!
                            // tegelt pead archivema, kuna muidu ei näe overall statisticut!
                    }
                    } message: {
                        Text("Are you sure you want to delete this workout?")
                    }
                }
            VStack {
                 ForEach(exercisesList, id: \.self) { item in
                     HStack {
                         Text(item)
                         Spacer()
                     }.foregroundColor(.gray)
                 }
            }
            .padding(.top, 1)
            
            NavigationLink {
                navigationView
            } label: {
                Text("Start Workout")
                    .foregroundColor(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(.blue, lineWidth: 0.1))
                    
            }.cornerRadius(5)
            
            .padding([.top], 5)
            .padding([.bottom], 15)
            

            
        }
        .padding([.leading, .trailing, .top], 9)
        .frame(maxWidth: .infinity)
        .overlay(RoundedRectangle(cornerRadius: 4)
            .stroke(.gray, lineWidth: 1))
    }
}

struct WorkoutDescriptionComponent_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDescriptionComponent(navigationView: LoginView())
    }
}
