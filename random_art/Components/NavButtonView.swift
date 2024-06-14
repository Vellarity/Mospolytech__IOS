//
//  NavButtonView.swift
//  random_art
//
//  Created by user on 14.06.2024.
//

import SwiftUI

struct NavButtonView<Destination:View, Label:View>: View {
    var destination:Destination
    var label:() -> Label
    
    init(destination:Destination, @ViewBuilder label:@escaping () -> Label) {
        self.destination = destination
        self.label = label
    }
    
    var body: some View {
        NavigationLink(destination:destination, label: label)/*{
            Text("Generate!")
                .font(.title)
                .foregroundStyle(.white)
                .bold()
        }*/
        .frame(
            minWidth: 0,
            maxWidth:.infinity,
            minHeight: 0,
            maxHeight: 60,
            alignment: .center
        )
        .background(.black)
        .clipShape(.rect(cornerRadius: 20.0))
    }
}
/*
#Preview {
    NavButtonView()
}
*/
