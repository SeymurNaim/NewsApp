//
//  NewsModel.swift
//  NewsApp
//
//  Created by Seymur Naim on 06.06.24.
//

import Foundation


struct NewsModel: Codable {
    let status: String
    let copyright: String
    let last_updated: String
    let section: String
    let num_results: Int
    let results: [Resultss]
}

struct Resultss: Codable {
    let section: String?
    let title: String?
    let abstract: String?
    let url: String?
    let uri: String?
    let published_date: String?
    let multimedia: [Multimedia]?
}

struct Multimedia: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}
