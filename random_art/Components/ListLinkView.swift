//
//  ListLinkView.swift
//  random_art
//
//  Created by user on 14.06.2024.
//

import SwiftUI
import SwiftData

struct ListLinkView: View {
    
    @Environment(\.modelContext)
    private var context
    
    let link:ArtLink
    
    var body: some View {
        HStack{
            AsyncImage(
                url: URL(string: "https://www.artic.edu/iiif/2/\(link.image_id)/full/843,/0/default.jpg")
            ){
                image in image.image?.resizable()
            }
            .frame(
                width: 50,
                height: 50
            )
            .clipShape(.rect(cornerRadius: 5.0))
            
            Link(
                destination:
                    URL(string: "https://www.artic.edu/artworks/\(link.id)")!,
                label: {
                    Text("\(link.title)").fontWeight(.semibold).font(.title3)
                }
                
            )
            Spacer()
        }.contextMenu(menuItems: {
            Button(action: {context.delete(link)}, label: {
                Text("Delete item")
            })
        })
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ArtLink.self, configurations: config)
    
    let link = ArtLink(
        id: 129884,
        title: "Name",
        image_id: "e966799b-97ee-1cc6-bd2f-a94b4b8bb8f9"
    )

    container.mainContext.insert(link)

    
    return ListLinkView(link:link).modelContainer(container)
}
