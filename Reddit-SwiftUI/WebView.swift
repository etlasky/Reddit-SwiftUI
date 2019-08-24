//
//  PostWebView.swift
//  Reddit-SwiftUI
//
//  Created by Erik Lasky on 7/14/19.
//  Copyright © 2019 Erik Lasky. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        uiView.load(request)
    }
}

#if DEBUG
struct PostWebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "www.google.com")!))
    }
}
#endif
