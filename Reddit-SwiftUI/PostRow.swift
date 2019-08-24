//
//  PostCell.swift
//  Reddit-SwiftUI
//
//  Created by Erik Lasky on 6/8/19.
//  Copyright © 2019 Erik Lasky. All rights reserved.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        HStack {
            Image(systemName: "photo.fill")
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.headline)
                
                Text(post.subredditNamePrefixed)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#if DEBUG
struct PostCell_Previews : PreviewProvider {
    static var previews: some View {
        PostRow(post: Post(id: "", title: "Title", author: "author", url: "https://google.com", subredditNamePrefixed: "r/funny"))
            .previewLayout(.sizeThatFits)
    }
}
#endif
