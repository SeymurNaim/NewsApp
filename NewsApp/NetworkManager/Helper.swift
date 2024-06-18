//
//  Helper.swift
//  NewsApp
//
//  Created by Seymur Naim on 10.06.24.
//

import Foundation

public enum TopStoryCategory: Int {
    case home = 0
    case usa = 1
    case world = 2
    case science = 3
    case arts = 4
    
    var url: String? {
        switch self {
        case .home:
            return "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET"
        case .usa:
            return "https://api.nytimes.com/svc/topstories/v2/us.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET"
        case .world:
            return "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET"
        case .science:
            return "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET"
        case .arts:
            return "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET"
        }
    }
}








