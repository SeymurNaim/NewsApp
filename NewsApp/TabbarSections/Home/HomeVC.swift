//
//  HomeVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class HomeVC: UIViewController {
    
//    var categoryCollectionView = UICollectionView()
    var manager = ApiManager()
    var datas: [NewsModel] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        manager.fetchData { fetchedPosts, error in
            if let fetchedPosts = fetchedPosts {
                self.datas = fetchedPosts
                DispatchQueue.main.async {
//                    self.mainCollectionView.reloadData()
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }

    }
    



}
