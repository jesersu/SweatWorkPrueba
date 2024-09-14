//
//  ContentView.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 13/09/24.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
           
               
            TabView {
                NavigationView { MovieHomeView() }
                .tabItem { Label("Home", systemImage: "film")}
                .tag(0)
                
                NavigationView { MovieSearchView() }
                .tabItem { Label("Search", systemImage: "magnifyingglass")}
                .tag(1)
                NavigationView { WatchListView() }
                .tabItem { Label("Watch list", systemImage: "movieclapper")}
                .tag(2)
            }
        }
        .preferredColorScheme(.dark)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
