//
//  HomeVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit

class HomeVC: UIViewController {
    
    let categoryCollectionView: UICollectionView
    let contentCollectionView: UICollectionView
    var manager: ApiManagerService = ApiManager()
    var data: NewsModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let layout = UICollectionViewFlowLayout()
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        let layout = UICollectionViewFlowLayout()
        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "saamdsa"
        
        setupCollectionView()
        setupContentCollectionView()
        
        manager.fetchData { [weak self] fetchedData, error in
            guard let self = self else { return }
            if let fetchedData = fetchedData {
                self.data = fetchedData
                DispatchQueue.main.async {
                    self.categoryCollectionView.reloadData()
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.backgroundColor = .white
        categoryCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryCollectionView)
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 164),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupContentCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        contentCollectionView.collectionViewLayout = layout
        contentCollectionView.dataSource = self
        contentCollectionView.delegate = self
        contentCollectionView.backgroundColor = .systemGray6
        contentCollectionView.register(ContentCell.self, forCellWithReuseIdentifier: "ContentCell")
        contentCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentCollectionView)
        NSLayoutConstraint.activate([
            contentCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor),
            contentCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return 5
        } else if collectionView == contentCollectionView {
            return 5
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.categoryLabel.text = "World"
            return cell

        } else if collectionView == contentCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
            cell.carEngineLabel.text = "123"
            cell.carModelLabel.text = "mase"
            cell.carNameLabel.text = "Biden"
            cell.carPriceLabel.text = "2342"
            cell.layer.cornerRadius = 8
            
            return cell
        }
        
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: 100, height: 24)
        } else if collectionView == contentCollectionView {
            return CGSize(width: 364, height: 200)
        }
        
        return CGSize()
    }
}



#Preview() {
    HomeVC()
}
