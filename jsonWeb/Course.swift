//
//  Course.swift
//  jsonWeb
//
//  Created by Nana Adwoa Odeibea Amoah on 7/8/21.
//

import Foundation

class Course: Codable {
    var title = ""
    var subtitle = ""
    var imageURL = ""
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
        case imageURL = "image" //Special names
    }
    
}
