//
//  ContentCell.swift
//  NewsApp
//
//  Created by Seymur Naim on 07.06.24.
//

import UIKit

class ContentCell: UICollectionViewCell {
    let newsImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 14
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    
    let newsTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24, weight: .black)
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    let publishedDate: UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 20, weight: .light)
        date.numberOfLines = 0
        date.adjustsFontSizeToFitWidth = true
        date.textColor = .systemGray
        date.translatesAutoresizingMaskIntoConstraints = false
        
        return date
    }()
    
    let dotsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(newsTitle)
        addSubview(newsImage)
        addSubview(publishedDate)
        addSubview(dotsButton)

        
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            newsImage.heightAnchor.constraint(equalToConstant: 200),
            
            
            newsTitle.topAnchor.constraint(equalTo: newsImage.bottomAnchor),
            newsTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            newsTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            newsTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
            
            publishedDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            publishedDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            dotsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dotsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
   

    }
    
    func configureCell(withImage image: String) {
        showImage(image: image, imageView: newsImage)
    }
}


//#Preview() {
//    HomeVC()
//}
