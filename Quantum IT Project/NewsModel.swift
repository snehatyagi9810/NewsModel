//
//  NewsModel.swift
//  Quantum IT Project
//
//  Created by Sneh on 02/09/23.
//

import Foundation

struct newsModel: Decodable {
    
    var status: String
    var articles: [Article]
}

struct Article: Decodable {
    var source: Source
    var author: String?
    var urlToImage: String?
    var content: String?
    var title: String?
    var publishedAt: String?
    var description: String?
}
struct Source: Decodable {
    var id: String?
    var name: String?
}
