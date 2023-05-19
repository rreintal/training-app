//
//  ProfileStatsComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct ProfileStatsComponent: View {
    
    @Binding
    var workoutsCount : Int
    
    @Binding
    var friendsCount : Int
    
    @Binding
    var totalVolumeCount : Int
    
    var body: some View {
        HStack(spacing: 40) {
            VStack {
                Text("Workouts").font(.system(.headline))
                Text(workoutsCount.description).font(.system(.callout))
            }
            VStack {
                Text("Friends").font(.system(.headline))
                Text(friendsCount.description).font(.system(.callout))
            }
            VStack {
                Text("Total volume").font(.system(.headline))
                Text(totalVolumeCount.description).font(.system(.callout))
            }
        }
        
    }
}

struct ProfileStatsComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStatsComponent(workoutsCount: .constant(10), friendsCount: .constant(22), totalVolumeCount: .constant(2003))
    }
}
