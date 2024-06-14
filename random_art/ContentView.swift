//
//  ContentView.swift
//  random_art
//
//  Created by user on 12.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                Rectangle().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 200).position(x:-10, y:250)
                Rectangle().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(width: 200).position(x:350, y:750)
                VStack(
                    alignment: .center,
                    spacing: 300
                ) {
                    Text("RANDOM ART")
                        .bold()
                        .font(.system(size: 50))
                        .padding(.top, 40)
                    VStack{
                        NavButtonView(destination: ArtView()){
                            Text("Generate!")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        NavButtonView(destination: FavouritesView()){
                            Text("Favourites")
                                .font(.title)
                                .foregroundStyle(.white)
                                .bold()
                        }
                    }
                }
                .padding(.all)
                .frame(
                    minWidth: 0,
                    maxWidth:.infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .top
                )
            }
        }
    
}

#Preview {
    ContentView()
}
