//
//  ArticleModel.swift
//  MobileTips
//
//  Created by pablo henrique on 02/02/25.
//

import Foundation

struct ArticleModel: Identifiable, Codable {
    let id: Int
    let title: String
    let tag_list: [String]
    let user: User
    let url: String
}

struct User: Codable {
    let profile_image: String
    let name: String
}
