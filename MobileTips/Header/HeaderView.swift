//
//  HeaderView.swift
//  MobileTips
//
//  Created by pablo henrique on 01/02/25.
//

import SwiftUI

struct HeaderView: View {
    
    @State private var searchText: String = ""
    
    @State private var valueSelected: String = ""
    
    private let options: [String] = ["React Native", "Flutter", "SwiftUI", "JetPack Compose"]
    
    var body: some View {
        HStack {
            
            Spacer()
            
            TextField("Pesquisar", text: $searchText)
                .keyboardType(.alphabet)
                .padding(12)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 2)
            
            Spacer()
            
            Menu {
                
                Button {
                    valueSelected = ""
                }label: {
                    Text("Limpar filtro")
                }
                
                Divider()

                
                ForEach(1...options.count, id: \.self) { option in
                    Button {
                        valueSelected = options[option - 1]
                        print(valueSelected)
                    } label: {
                        Text("\(options[option - 1])")
                    }
                }
                
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 24))
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    HeaderView()
}
