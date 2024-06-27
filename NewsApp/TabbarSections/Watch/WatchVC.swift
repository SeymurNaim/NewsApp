//
//  WatchVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 27.06.24.
//

import UIKit

class WatchVC: UIViewController {
    
    var model = Model()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        
        model.getVideos()
    }
    



}
