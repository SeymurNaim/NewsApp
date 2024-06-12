//
//  CategoryCell.swift
//  NewsApp
//
//  Created by Seymur Naim on 04.06.24.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    let categoryLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(categoryLabel)
        categoryLabel.textAlignment = .center
        categoryLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        categoryLabel.textColor = .black

        categoryLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}


#Preview() {
    HomeVC()
}
