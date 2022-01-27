//
//  VideoModel.swift
//  Africa
//
//  Created by Егор Шереметов on 10.12.2021.
//

import Foundation

class Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(self.id)"
    }
}
