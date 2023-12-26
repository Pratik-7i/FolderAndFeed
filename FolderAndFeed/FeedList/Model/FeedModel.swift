//
//  FeedModel.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import Foundation

struct ResponseModel: Codable {
    let status : String?
    let source : String?
    let sortBy : String?
    let articles : [Feed]?
}

struct Feed: Codable {
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
}
