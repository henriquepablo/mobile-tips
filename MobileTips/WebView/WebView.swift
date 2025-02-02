//
//  WebView.swift
//  MobileTips
//
//  Created by pablo henrique on 02/02/25.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: URL
    
    // Função que cria o WKWebView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    // Função que atualiza o WKWebView, permitindo a navegação
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
