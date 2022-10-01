//
//  ContentView.swift
//  movies
//
//  Created by Jesus Grimaldo on 28/09/22.
//

import SwiftUI

struct ContentView: View {
    
   
    @State private var selection = 0

    
    
    var body: some View {
        TabView(selection: $selection) {
        
             HomeView().tabItem {
                Label("Tv Show", systemImage: "play.tv.fill")
            }
            FavoritosView() .tabItem {
                Label("Favoritos", systemImage: "star.fill")
            }
            
        }
        .accentColor(.purple)
    }
}


