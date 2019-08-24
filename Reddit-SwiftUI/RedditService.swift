//
//  RedditService.swift
//  Reddit-SwiftUI
//
//  Created by Erik Lasky on 6/9/19.
//  Copyright © 2019 Erik Lasky. All rights reserved.
//

import Foundation

class RedditService {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    func searchSubreddit(for query: String, completion: @escaping (Result<[Post], Error>) -> Void) {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: "https://www.reddit.com/\(trimmedQuery.count == 0 ? "" : "r/\(trimmedQuery)").json") else {
            preconditionFailure("Failed to construct search URL for query: \(query)")
        }
        
        session.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(Listing.self, from: data)
                    completion(.success(response?.posts ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
