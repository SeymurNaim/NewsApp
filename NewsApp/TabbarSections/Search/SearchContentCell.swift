//
//  SearchContentCell.swift
//  NewsApp
//
//  Created by Seymur Naim on 27.06.24.
//

import UIKit

class SearchContentCell: UITableViewCell {

    let newsImage: UIImageView = {
            let image = UIImageView()
            image.clipsToBounds = true
            image.layer.cornerRadius = 14
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()

        let newsTitle: UILabel = {
            let title = UILabel()
            title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            title.numberOfLines = 0
            title.adjustsFontSizeToFitWidth = true
            title.textColor = .black
            title.translatesAutoresizingMaskIntoConstraints = false
            
            return title
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

            NSLayoutConstraint.activate([
                newsTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                newsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                newsTitle.trailingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: -12),
                newsTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                
                newsImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                newsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                newsImage.heightAnchor.constraint(equalToConstant: 88),
                newsImage.widthAnchor.constraint(equalToConstant: 88)
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
