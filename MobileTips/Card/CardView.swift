//
//  CardView.swift
//  MobileTips
//
//  Created by pablo henrique on 02/02/25.
//

import SwiftUI

struct CardView: View {
    
    let post: ArticleModel
    
    var body: some View {
        VStack{
            HStack {
               AsyncImage(url: URL(string: post.user.profile_image)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                } placeholder: {
                    ProgressView()  
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                Text(post.user.name)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(post.title)
                        .padding(.bottom, 5)
                        .font(.system(size: 22))
                        .bold()
                    
                    HStack {
                        ForEach(post.tag_list, id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 12))
                                .padding(5)
                                .border(Color.gray, width: 1)
                                .background(Color.gray)
                                .foregroundStyle(Color.white)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            
        }
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
        .padding(10)
        
        
    }
}

#Preview {
    CardView(post: ArticleModel.init(id: 1, title: "Test" ,tag_list: ["React", "Native"], user: User.init(profile_image: "teste", name: "teste"), url: "teste"))
}
