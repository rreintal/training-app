//
//  LoadMoreFriendsPlusButton.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct LoadMoreFriendsPlusButton: View {
    
    var action: () async -> Void
    
    
    var body: some View {
        Button {
            Task {
                await action()
            }
        } label: {
            ZStack {
                Circle().frame(height: 50)
                Text("+").foregroundColor(.white).font(.system(size: 30))
            }
        }

    }
}

struct LoadMoreFriendsPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreFriendsPlusButton(action: {})
    }
}
