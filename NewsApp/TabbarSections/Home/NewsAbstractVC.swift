//
//  NewsAbstractVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 19.06.24.
//

import UIKit

class NewsAbstractVC: UIViewController {
    
    var selectedData: Results?
    
    lazy var newsTitle: UILabel? = {
        let title = UILabel()
        title.text = "\(selectedData?.title)"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    lazy var newsImage: UIImageView? = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var newsAbstract: UILabel? = {
        let abstract = UILabel()
        abstract.translatesAutoresizingMaskIntoConstraints = false
        abstract.numberOfLines = 0
        return abstract
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    
    private func configure() {
        view.addSubview(newsTitle!)
        view.addSubview(newsImage!)
        view.addSubview(newsAbstract!)
        
        NSLayoutConstraint.activate([
            newsTitle!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            newsTitle!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsTitle!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newsTitle!.heightAnchor.constraint(equalToConstant: 200),
            
            newsImage!.topAnchor.constraint(equalTo: newsTitle!.bottomAnchor, constant: 16),
            newsImage!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsImage!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newsImage!.heightAnchor.constraint(equalToConstant: 200),
            
            newsAbstract!.topAnchor.constraint(equalTo: newsImage!.bottomAnchor, constant: 16),
            newsAbstract!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsAbstract!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newsAbstract!.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    

  

}



