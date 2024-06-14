//
//  ArtView.swift
//  random_art
//
//  Created by user on 12.06.2024.
//

import SwiftUI

struct ArtView: View {
    @State var artData = ArtData()
    @State var artDescription:NSMutableAttributedString? = nil
    @State var artLink:ArtLink? = nil
    
    @State private var isLike = false
    
    @Environment(\.modelContext)
    private var context
    
    var body: some View {
        ScrollView{
            ZStack{
                AsyncImage(
                    url:URL(string: "https://www.artic.edu/iiif/2/\(artData.data?.image_id ?? "")/full/843,/0/default.jpg")
                ) {
                    image in image.image?.resizable()
                }
                .frame(
                    width: 350,
                    height: 350
                )
                .clipShape(.rect(cornerRadius: 20.0))
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        if (artData.data != nil){
                            if (!isLike){
                                Image(systemName: "heart")
                                    .foregroundColor(.red)
                                    .font(.system(size:40))
                                    .padding(10)
                                    .onTapGesture {
                                        isLike = !isLike
                                        
                                        context.insert(artLink!)
                                    }
                            } else {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size:40))
                                    .padding(10)
                                    .onTapGesture {
                                        isLike = !isLike
                                        
                                        context.delete(artLink!)
                                    }
                            }
                        }
                    }
                }
                
            }

            VStack(){
                HStack(){
                    Text("\(artData.data?.title ?? "No name")")
                        .fontWeight(.semibold)
                        .font(.title)
                    Spacer()
                }
                HStack(){
                    Text("\(artData.data?.artist_title ?? "Unknown Author")").fontWeight(.semibold)
                    Spacer()
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }.padding(.horizontal)

            Divider().padding(.horizontal)
            
            VStack{
                HStack{
                    Text("Year").font(.title3).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("\(artData.data?.date_display ?? "unknown date")")
                }
            }.padding(.horizontal)
            
            Divider().padding(.horizontal)
            
            VStack(){
                HStack(){
                    Text("Description:").font(.title3).fontWeight(.bold)
                    Spacer()
                }

                HStack{
                    if (artDescription != nil){
                        Text("\(artDescription!)")
                    } else {
                        Text("No description :(").italic()
                        Spacer()
                    }
                    
                }
                
                Divider()
                
                HStack{
                    if (artData.data?.id != nil) {
                        Link(
                            destination:
                                URL(string: "https://www.artic.edu/artworks/\(artData.data?.id ?? 10)")!, label: {
                                    Text("Link to the work")
                                }
                        )
                        Spacer()
                    }

                }
                
            }.padding(.horizontal)
        }
        .padding(.horizontal)
        .task(){
            self.artData = await ArtViewModel().getArt()
            
            if self.artData.data?.description != nil {
                if let attributedDescription = try? NSMutableAttributedString(
                    data: (self.artData.data?.description)!.data(using: .utf16)!,
                    options: [.documentType: NSAttributedString.DocumentType.html],
                    documentAttributes:nil) {
                    let textRangeForFont : NSRange = NSMakeRange(0, attributedDescription.length)
                    
                    attributedDescription.addAttributes([NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 16)], range: textRangeForFont)
                    
                    self.artDescription = attributedDescription
                }
            }
            
            self.artLink = ArtLink(
                id:(self.artData.data)!.id!,
                title:(self.artData.data)!.title!,
                image_id: (self.artData.data)!.image_id!
            )

        }
    }
}

#Preview {
    ArtView()
        .modelContainer(for:[ArtLink.self])
}
