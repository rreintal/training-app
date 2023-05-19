//
//  FeedPostComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct FeedPostComponent: View {
    var minutesAgo : String = "2"
    
    var body: some View {
        
        VStack(alignment: .leading) {
            FeedHeaderComponent(minutesAgo: minutesAgo)
            Text("Finished workout PPL")
        }
        
        
    }
}

struct FeedPostComponent_Previews: PreviewProvider {
    static var previews: some View {
        FeedPostComponent()
    }
}
