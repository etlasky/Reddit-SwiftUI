//
//  ListingViewModel.swift
//  Reddit-SwiftUI
//
//  Created by Erik Lasky on 6/9/19.
//  Copyright © 2019 Erik Lasky. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class ListingViewModel: ObservableObject {
    let service: RedditService
    
    @Published var subreddit = "r/all"
    @Published var posts = [Post]()
    
    init(service: RedditService) {
        self.service = service
    }
    
    func fetchListing(for query: String) {
        service.searchSubreddit(for: query) { [weak self] result in
            DispatchQueue.main.async {                
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure:
                    self?.posts = []
                }
            }
        }
    }
}
