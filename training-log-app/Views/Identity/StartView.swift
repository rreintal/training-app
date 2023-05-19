//
//  StartView.swift
//  training-log-app
//
//  Created by Richard Reintal on 19.04.2023.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            VStack {
                // TODO
                // Mõtle, mis sellega ette võtta!!
                // kas eemaldad või tee logo!
                VStack(alignment: .leading) {
                    Image(systemName: "dumbbell")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                }
                .offset(x:-2, y: 35)
                .padding([.trailing], 310)
                .opacity(0)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                // this vstack
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        BigHeader(content: "Application", textColor: .white)
                        
                        
                        Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy ")
                            .font(.system(size: 20))
                            .foregroundColor(.white).opacity(0.8)
                            
                        
                    }.padding([.bottom], 40)
                        
                    
                    VStack {
                        // Tee eraldi button component!
                        WideButton(navigationView: LoginView(),
                                   content: "Log in",
                                   backgroundColor: .white,
                                   textColor: .blue)
                            .padding([.bottom], 10)
                        
                        WideButton(navigationView: RegisterView(),
                                   content: "Sign up",
                                   backgroundColor: .blue,
                                   textColor: .white)
                    }
                    
                }.frame(maxWidth: .infinity)
                .padding([.leading, .trailing], 20)
                
            
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(
                AppEntry.PrimaryBackground
            )
        }
        
        
    }
}
    


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
