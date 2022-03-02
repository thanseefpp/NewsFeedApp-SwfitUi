//
//  WebView.swift
//  NewsFeed
//
//  Created by THANSEEF on 02/03/22.
//

import SwiftUI
import WebKit


// calling UiKit features to swiftui

struct WebView: UIViewRepresentable {
    
    let urlString : String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
