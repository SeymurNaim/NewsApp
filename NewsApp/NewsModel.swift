//
//  NewsModel.swift
//  NewsApp
//
//  Created by Seymur Naim on 06.06.24.
//

import Foundation


struct NewsModel: Codable {
    let id: String
    let title: String
    let description: String
    let url: String
    let author: String
    let image: String
    let language: String
    let category: String
    let published: String
}
