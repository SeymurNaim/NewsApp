//
//  BasketCell.swift
//  NewsApp
//
//  Created by Seymur Naim on 27.06.24.
//

import UIKit

class BasketCell: UITableViewCell {

    let newsImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let newsTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    let publishedDate: UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 12, weight: .light)
        date.numberOfLines = 0
        date.adjustsFontSizeToFitWidth = true
        date.textColor = .systemGray
        date.translatesAutoresizingMaskIntoConstraints = false
        
        return date
    }()
    
        

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
            backgroundColor = .white
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupViews() {
            contentView.addSubview(newsTitle)
            contentView.addSubview(newsImage)
            contentView.addSubview(publishedDate)

            NSLayoutConstraint.activate([
                newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                newsImage.heightAnchor.constraint(equalToConstant: 88),
                newsImage.widthAnchor.constraint(equalToConstant: 120),
                
                newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                newsTitle.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 12),
                newsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                newsTitle.heightAnchor.constraint(equalToConstant: 64),
                
                publishedDate.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 8),
                publishedDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                publishedDate.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 12),
                publishedDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
                

            ])
        }
        
        func configureCell(withImage image: String) {
            showImage(image: image, imageView: newsImage)
        }
        
        private func showImage(image: String, imageView: UIImageView) {
            if let url = URL(string: image) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }.resume()
            }
        }

}
