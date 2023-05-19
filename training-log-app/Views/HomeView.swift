//
//  HomeView.swift
//  training-log-app
//
//  Created by Richard Reintal on 17.02.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State
    var users : [User] = []
    
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome back \(AppEntry.AppState.username.description)! 👋")
                    .font(.headline)
                    .foregroundColor(.white)
                
            }.frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 200)
                .background(Color(.systemBlue))
                .padding([.bottom], -8)
            
            
            
            
            LineBreak()
            VStack(alignment: .leading) {
                Text("Users you might know").font(.headline)
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach((users)) { user in
                            FriendCardComponent(name: user.Name)
                                .transition(.move(edge: .top))
                                .animation(.easeInOut(duration: 0.7))
                        }
                        LoadMoreFriendsPlusButton {
                            await UsersAPI.GetMoreUsers().forEach { item in
                                users.append(item)
                            }
                        }
                    }
                }.scrollIndicators(.hidden)
                
            }
            .padding([.leading, .trailing], 30)
            LineBreak()
            Spacer()
            Button("AAAA") {
                Task {
                    var item = await AppEntry.AppState.WebController.sendRequest(
                        requestUrl: "http://localhost:5187/api/v1.0/Refresh/GetItems",
                        httpMethod:HTTPMethod.POST,
                        payload: ItemWithName(Name: "name"),
                        ReturnType:ItemWithName.self
                    )
                    if let itemWithName = item as? ItemWithName {
                        // `itemWithName` is now of type `ItemWithName`
                        // You can access its properties and use it accordingly
                        print(itemWithName.Name)
                    }
                    
                    
                    
                }
            }.buttonStyle(.borderedProminent)
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        .opacity(0.9)
        .onAppear{
            users = UsersAPI.GetUsers()
        }
    }
    
    
    func whichColorToUse(_ scheme : ColorScheme) -> Color {
        if (scheme == .dark) {
            return Color(uiColor: .systemGray6)
        }
        return .black
    }
    
    func useColorBasedOnSchema(_ schema : ColorScheme , darkModeColor : Color, lightModeColor : Color) -> Color {
        if (schema == .dark) {
            return darkModeColor
        }
        return lightModeColor
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//

struct WavingEmojiView: View {
    let emoji: String
    
    @State private var waveOffset: CGFloat = 0
    
    var body: some View {
        Text(emoji)
            .modifier(WaveAnimation(offset: waveOffset))
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                    // LISA .repeatForever() KUI TAHAD,ET REPLAY PEAL OLEKS
                    self.waveOffset += 360
                }
            }
    }
}

struct WaveAnimation: AnimatableModifier {
    var offset: CGFloat = 0
    
    var animatableData: CGFloat {
        get { offset }
        set { offset = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(y: 5 * sin((offset * .pi) / 180))
            .rotationEffect(.degrees(-6 * sin((offset * .pi) / 180.0)))
        
    }
}

//


