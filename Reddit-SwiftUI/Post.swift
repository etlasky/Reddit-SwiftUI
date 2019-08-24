//
//  Post.swift
//  Reddit-SwiftUI
//
//  Created by Erik Lasky on 6/8/19.
//  Copyright © 2019 Erik Lasky. All rights reserved.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    var id: String
    var title: String
    var author: String
    var url: String
    var subredditNamePrefixed: String
}

// MARK: - Decodable

extension Post: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case url
        case subredditNamePrefixed = "subreddit_name_prefixed"
        
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        id = try dataContainer.decode(String.self, forKey: .id)
        title = try dataContainer.decode(String.self, forKey: .title)
        author = try dataContainer.decode(String.self, forKey: .author)
        url = try dataContainer.decode(String.self, forKey: .url)
        subredditNamePrefixed = try dataContainer.decode(String.self, forKey: .subredditNamePrefixed)
    }
}
