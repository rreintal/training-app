//
//  ProfileViewCalendarComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct ProfileViewCalendarComponent: View {
    @State private var date = Date()
    
    let specialDates = [2, 5, 6, 10]
    
    var body: some View {
        
        DatePicker(selection: $date, displayedComponents: [.date]) {
            Text("Abc")
        }.datePickerStyle(.graphical)
        
        
    }
}

struct ProfileViewCalendarComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewCalendarComponent()
    }
}
