//
//  ApiManager.swift
//  NewsApp
//
//  Created by Seymur Naim on 31.05.24.
//

import Foundation
import Alamofire

protocol ApiManagerService {
    func fetchData(completion: @escaping (NewsModel?, Error?) -> Void)
}


//class ApiManager: ApiManagerService {
//    func fetchData(completion: @escaping ([NewsModel]?, Error?) -> Void) {
//    let url = "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET"
//        
//        AF.request(url).responseData { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    let fetchedPosts = try JSONDecoder().decode([NewsModel].self, from: data)
//                    DispatchQueue.main.async {
//                        completion(fetchedPosts, nil)
//                    }
//                } catch {
//                    DispatchQueue.main.async {
//                        completion(nil, error)
//                    }
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    completion(nil, error)
//                }
//            }
//        }
//    }
//}



class ApiManager: ApiManagerService {
    func fetchData(completion: @escaping (NewsModel?, Error?) -> Void) {
        let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/science.json?api-key=QiGO3SPKk65VT1SA5x905SuwRjoTxNET")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            do {
                let fetchedData = try JSONDecoder().decode(NewsModel.self, from: data)
                DispatchQueue.main.async {
                    completion(fetchedData, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}

