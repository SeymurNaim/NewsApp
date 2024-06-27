//
//  Model.swift
//  NewsApp
//
//  Created by Seymur Naim on 27.06.24.
//

import Foundation


public class Model {
    func getVideos() {
        let url = URL(string: Constants.ApiUrl)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            
            if error != nil || data == nil {
                return
            }
        }
        
        dataTask.resume()
    }
}
