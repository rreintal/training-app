//
//  FeedHeaderComponent.swift
//  training-log-app
//
//  Created by Richard Reintal on 21.02.2023.
//

import SwiftUI

struct FeedHeaderComponent: View {
    
    var name : String = "Hugo"
    var imageName : String = "men1"
    
    var minutesAgo : String = "2"
    
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                Circle()
                    .fill(Color(uiColor: .systemGray4))
                    .frame(width: 55)
                    .padding([.trailing], 10)
                CircleImageComponent(imageName: imageName, imageSize: CGFloat(50)).padding([.trailing], 10)
            }
                .clipShape(ImageClip(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text(name).font(.system(size: 20))
                Text("\(minutesAgo) min ago").font(.system(size: 12))
                    .padding([.trailing], 20)
            }
                .clipShape(TopLeftBottomRightRoundedRectangle(cornerRadius: 7))
                .padding([.top], 15)
                // PROLLY KUSTUTA ÄRA JA MÕTLE PAREM IDEE VÄLJA!
        }
    }
    
    // VAATA SEDA KOODI JA PROOVI ARU SAADA!!!
    struct TopLeftBottomRightRoundedRectangle: Shape {
        var cornerRadius: CGFloat

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            return Path(path.cgPath)
        }
    }
    
    struct ImageClip: Shape {
        var cornerRadius: CGFloat

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            return Path(path.cgPath)
        }
    }
    
    struct FeedHeaderComponent_Previews: PreviewProvider {
        static var previews: some View {
            FeedHeaderComponent()
        }
    }
}
