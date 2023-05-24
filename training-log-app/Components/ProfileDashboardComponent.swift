//
//  ProfileDashboardComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct ProfileDashboardComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dashboard").font(.system(.headline))
            VStack {
                HStack {
                    BigRectangleButton(
                        imageName: "chart.bar",
                        buttonContent: "STATISTICS",
                        navigationView: StatisticsView())
                    
                    BigRectangleButton(imageName: "speedometer", buttonContent: "MEASURES", navigationView: EmptyView())
                }
                HStack {
                    BigRectangleButton(imageName: "dumbbell", buttonContent: "EXERCISES", navigationView: EmptyView())
                    BigRectangleButton(imageName: "calendar", buttonContent: "CALENDAR", navigationView: EmptyView())
                }
            }
        }
    }
}

struct ProfileDashboardComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDashboardComponent()
    }
}
