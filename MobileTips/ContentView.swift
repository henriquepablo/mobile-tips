//
//  ContentView.swift
//  MobileTips
//
//  Created by pablo henrique on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            ScrollView(showsIndicators: false) {
                CardView()
                CardView()
                CardView()
                CardView()
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color(.init(white: 0, alpha: 0.05)))
    }
}

#Preview {
    ContentView()
}
