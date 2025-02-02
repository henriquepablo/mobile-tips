//
//  CardView.swift
//  MobileTips
//
//  Created by pablo henrique on 02/02/25.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "person.fill")
                    .font(.system(size: 16))
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.gray, lineWidth: 2))
                
                Text("Name")
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Title")
                        .padding(.bottom, 5)
                        .font(.title2)
                        .bold()
                    
                    Text("Tags")
                        .font(.subheadline)
                        .padding(3)
                        .border(Color.gray, width: 1)
                        .cornerRadius(2)
                        .background(Color.gray)
                        .foregroundStyle(Color.white)
                        
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
        
        
    }
}

#Preview {
    CardView()
}
