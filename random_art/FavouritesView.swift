//
//  FavouritesView.swift
//  random_art
//
//  Created by user on 14.06.2024.
//

import SwiftUI
import SwiftData

struct FavouritesView: View {
    @Environment(\.modelContext)
    private var context
    
    @Query()
    private var artList: [ArtLink]
    
    var body: some View {
        if artList.isEmpty{
            VStack{
                Text("No favourites :(").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
        } else {
            List(artList, id:\.id){item in
                ListLinkView(link: item)
            }
        }
    }
}

#Preview {
    FavouritesView()
        .modelContainer(for: [ArtLink.self])
}
