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
//    let subsection: String?
    let title: String?
    let abstract: String?
    let url: String?
    let uri: String?
//    let byline: String?
//    let item_type: String?
//    let updated_date: String?
//    let created_date: String?
    let published_date: String?
//    let material_type_facet: String?
//    let kicker: String?
//    let des_facet: [String]?
//    let org_facet: [String]?
//    let per_facet: [String]?
//    let geo_facet: [String]?
    let multimedia: [Multimedia]?
//    let short_url: String?
}

struct Multimedia: Codable {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
//    let type: String?
//    let subtype: String?
//    let caption: String?
//    let copyright: String?
}
