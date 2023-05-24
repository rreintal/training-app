//
//  StatisticsViewSessionButton.swift
//  training-log-app
//
//  Created by Richard Reintal on 23.05.2023.
//

import SwiftUI

struct StatisticsViewSessionButton<T : View>: View {
    
    var name : String
    var navigationView : T?
    var body: some View {
        NavigationLink {
            // dest
            navigationView
        } label: {
            HStack {
                Text(name)
                Spacer()
                Image(systemName: "eye")
                
            }.foregroundColor(.blue)
                .padding(10)
                .font(.system(size: 20))
                
        }
        
            .padding([.leading, .trailing])
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
            .cornerRadius(5)
    }
}

struct StatisticsViewSessionButton_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsViewSessionButton(name: "Push - 21.10.1997", navigationView: LoginView())
    }
}
