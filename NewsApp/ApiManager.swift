//
//  ApiManager.swift
//  NewsApp
//
//  Created by Seymur Naim on 31.05.24.
//

import Foundation
import Alamofire

protocol ApiManagerService {
    func fetchData(completion: @escaping ([NewsModel]?, Error?) -> Void)
}

class ApiManager: ApiManagerService {
    func fetchData(completion: @escaping ([NewsModel]?, Error?) -> Void) {
        let apiToken = "Jpv2-NjLW9lwtgLdiOgbHBphoIoxXdcHMXjcTlDLImHe1_7Q"
        let url = "https://api.currentsapi.services/v1/latest-news?apiKey=\(apiToken)"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let fetchedPosts = try JSONDecoder().decode([NewsModel].self, from: data)
                    DispatchQueue.main.async {
                        completion(fetchedPosts, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}

