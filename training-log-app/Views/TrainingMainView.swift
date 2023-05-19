//
//  TrainingMainView.swift
//  training-log-app
//
//  Created by Richard Reintal on 20.02.2023.
//

import SwiftUI

struct TrainingMainView: View {
    

    @State
    var isPresented : Bool = false
    
    
    @State
    var workouts : [Workout]
    //
    var body: some View {
        NavigationView {
            
            
            // container
            VStack {
                
                VStack{
                    // Heading
                    HStack {
                        Text("Quick start")
                            .font(.system(size: 19))
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    // -heading
                    
                    
                    // workouts section - create new
                    HStack {
                        NavigationLink {
                            CreateWorkoutView()
                        } label: {
                            HStack {
                                Image(systemName: "plus")
                                    .padding([.leading], 12)
                                Text("Create new workout")
                                    .foregroundColor(.black)
                                    .fontWeight(.regular)
                                    .padding([.top, .trailing, .bottom], 10)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 1))
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("My Workouts")
                                .font(.system(size: 19))
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                        ScrollView(showsIndicators: false) {
                            ForEach(workouts) { workout in
                                VStack {
                                    WorkoutDescriptionComponent(
                                        navigationView: WorkoutView(workoutId: workout.Id),
                                        workoutName: workout.Name,
                                        exercisesList: workout.getExercisesStringList()
                                    )
                                }
                            }

                        }
                        .padding(.top, 10)
                    }
                    .padding([.top], 30)
                }.padding([.leading, .trailing], 20)
                    .padding([.top], 30)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
                Task {
                    workouts = await WorkoutsAPI.getWorkouts()
                }
            }
            
            
            
        }
    }
    
}

struct TrainingMainView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingMainView(workouts: [])
    }
}
