//
//  SavedNews.swift
//  NewsApp
//
//  Created by Seymur Naim on 27.06.24.
//

import RealmSwift
import Foundation

class SavedNews: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var publishedDate: String = ""
    @objc dynamic var imageURL: String = ""
   // @objc dynamic var abstract: String = ""
}
