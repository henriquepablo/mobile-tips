//
//  ContentView.swift
//  MobileTips
//
//  Created by pablo henrique on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var articles: [ArticleModel] = []
    
    @State private var searchText: String = ""
    
    @State private var valueSelected: String = ""
    
    @State private var showWebView = false
    
    @State private var selectedURL: URL?
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(searchText: $searchText, valueSelected: $valueSelected)
                    .onChange(of: valueSelected) { oldValue, newValue in
                        getArticles(tag: newValue)
                    }
                    .onChange(of: searchText) { oldValue, newValue in
                        getArticles(tag: newValue.lowercased().replacingOccurrences(of: " ", with: ""))
                    }
                
                ScrollView(showsIndicators: false) {
                    
                    if articles.isEmpty {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    } else {
                        ForEach(articles) { post in
                            Button {
                                showWebView = true
                                selectedURL =  URL(string: post.url)
                            } label: {
                                CardView(post: post)
                            }
                            .foregroundStyle(Color.black)
                        }
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .background(Color(.init(white: 0, alpha: 0.05)))
            .ignoresSafeArea(.container, edges: .bottom)
            .onAppear() {
                getArticles(tag: "mobile")
            }
            .sheet(isPresented: $showWebView) {
                if let url = selectedURL {
                    WebView(url: url)
                        .ignoresSafeArea()
                } else {
                    Text("URL inválida ou não disponível")
                        .foregroundColor(.red)
                }
            }
        }
    }
    
    func getArticles(tag: String) {
        // A URL de destino
        let urlString = "https://dev.to/api/articles?tag=\(tag)"

        if let url = URL(string: urlString) {
           
            let request = URLRequest(url: url)
            
            
            let session = URLSession.shared
            
          
            let task = session.dataTask(with: request) { data, response, error in
              
                if let error = error {
                    print("Erro: \(error.localizedDescription)")
                    return
                }
                
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                  
                    if let data = data {
                        do {
                          

                            let decodedPosts = try JSONDecoder().decode([ArticleModel].self, from: data)
                            
                           
                            DispatchQueue.main.async {
                                self.articles = decodedPosts
                            }
                                                        
                        } catch {
                            print("Erro ao tentar converter os dados para JSON: \(error.localizedDescription)")
                        }
                    }
                } else {
                    print("Resposta não foi 200 OK.")
                }
            }
            
            task.resume()
        }
    }
}

#Preview {
    ContentView()
}
