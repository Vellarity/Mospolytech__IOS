//
//  ArtModel.swift
//  random_art
//
//  Created by user on 12.06.2024.
//

import Foundation


struct ArtData: Hashable, Codable {
    var data:Art?
}

struct Art : Hashable, Codable {
    var id: Int?
    var image_id: String?
    var artist_title: String?
    var date_display: String?
    var description:String?
    var title:String?
}


