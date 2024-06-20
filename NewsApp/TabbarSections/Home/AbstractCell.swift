//
//  AbstractCell.swift
//  NewsApp
//
//  Created by Seymur Naim on 19.06.24.
//



import UIKit

class AbstractCell: UITableViewCell {
    
    lazy var newsTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24, weight: .black)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    lazy var newsImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var newsAbstract: UILabel = {
        let abstract = UILabel()
        abstract.numberOfLines = 0
        abstract.font = UIFont.systemFont(ofSize: 24)
        abstract.translatesAutoresizingMaskIntoConstraints = false
        return abstract
    }()
    
    lazy var publishedDate: UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 20, weight: .light)
        date.numberOfLines = 0
        date.adjustsFontSizeToFitWidth = true
        date.textColor = .systemGray
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    lazy var webButton: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Website", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        contentView.addSubview(newsImage)
        contentView.addSubview(newsTitle)
        contentView.addSubview(newsAbstract)
        contentView.addSubview(publishedDate)
        contentView.addSubview(webButton)
        
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 300),
            
            newsTitle.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 16),
            newsTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            publishedDate.topAnchor.constraint(equalTo: newsTitle.bottomAnchor, constant: 16),
            publishedDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            publishedDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            newsAbstract.topAnchor.constraint(equalTo: publishedDate.bottomAnchor, constant: 16),
            newsAbstract.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsAbstract.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            webButton.topAnchor.constraint(equalTo: newsAbstract.bottomAnchor, constant: 24),
            webButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            webButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            webButton.heightAnchor.constraint(equalToConstant: 44),
            webButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with data: Results) {
        newsTitle.text = data.title
        newsAbstract.text = data.abstract
        publishedDate.text = data.published_date
        if let imageUrlString = data.multimedia?.first?.url, let url = URL(string: imageUrlString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.newsImage.image = image
                    }
                }
            }.resume()
        }
    }
}


