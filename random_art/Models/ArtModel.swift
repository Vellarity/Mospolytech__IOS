//
//  Art.swift
//  random_art
//
//  Created by user on 14.06.2024.
//

import Foundation
import SwiftData

@Model
final class ArtLink {
    @Attribute(.unique) var id: Int
    var title:String
    var image_id:String
    
    init(id:Int, title:String, image_id:String){
        self.id = id
        self.title = title
        self.image_id = image_id
    }
}
