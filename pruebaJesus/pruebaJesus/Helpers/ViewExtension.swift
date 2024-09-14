//
//  ViewExtensio.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 13/09/24.
//  Copyright © 2024 Jesus Chapi. All rights reserved.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offSetX(completion: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay{
                GeometryReader {
                    let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                    
                    Color.clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self, perform: completion)
                }
            }
        
    }
    
    @ViewBuilder
    func tabMask(_ tabProgress: CGFloat) -> some View {
        let selected : [MovieListEndpoint] = [.nowPlaying, .upcoming, .upcoming]
        ZStack {
            self.foregroundStyle(.gray)
            
            self
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .mask{
                    GeometryReader{
                        let size = $0.size
                        let capsuleWidth = size.width / CGFloat(selected.count)
                        Capsule()
                           
                            .frame(width: capsuleWidth)
                            .offset(x: tabProgress * (size.width - capsuleWidth))
                    }
                }
        }
    }
}


extension Color{
   static let theme = ColorTheme()
}

struct ColorTheme {
    let background = Color("background")
    let primary = Color("primary")
    let text = Color("text")
}

#Preview {
    ContentView()
}
