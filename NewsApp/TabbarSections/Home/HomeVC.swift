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
    var selectedIndex: Int = 0
    
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
        title = "DDX"
        
        setupCollectionView()
        setupContentCollectionView()
        
        fetchData(for: .home)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(customButtonTapped))
    }
    
    @objc func customButtonTapped() {
        // İşlem eklenecek
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.backgroundColor = .white
        categoryCollectionView.showsHorizontalScrollIndicator = false  // Yatay kaydırma göstergesini gizle
        categoryCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(categoryCollectionView)
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
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
        contentCollectionView.showsVerticalScrollIndicator = false
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
    
    private func fetchData(for category: TopStoryCategory) {
        manager.fetchData(for: category) { [weak self] fetchedData, error in
            guard let self = self else { return }
            if let fetchedData = fetchedData {
                self.data = fetchedData
                DispatchQueue.main.async {
                    self.contentCollectionView.reloadData()
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    let categories = ["Home", "USA", "World", "Science", "Arts"]
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categories.count
        } else if collectionView == contentCollectionView {
            return data?.results.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.categoryLabel.text = categories[indexPath.item]
            cell.selectedIndicator.isHidden = indexPath.item != selectedIndex
            return cell
        } else if collectionView == contentCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
            cell.configureCell(withImage: "\(data?.results[indexPath.item].multimedia?[0].url ?? "")")
            cell.newsTitle.text = "\(data?.results[indexPath.item].title ?? "3h ago")"
            cell.publishedDate.text = "\(data?.results[indexPath.item].published_date ?? "3h ago")"
            cell.layer.cornerRadius = 8
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let previousIndex = selectedIndex
            selectedIndex = indexPath.item
            let previousIndexPath = IndexPath(item: previousIndex, section: 0)
            collectionView.reloadItems(at: [previousIndexPath, indexPath])
            
            if let category = TopStoryCategory(rawValue: selectedIndex) {
                fetchData(for: category)
            }
        } else if collectionView == contentCollectionView {
            let selectedIndexx = indexPath.item
            let vc = NewsAbstractVC()
            vc.selectedData = data?.results[selectedIndexx]
            navigationController?.show(vc, sender: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: 100, height: 44)
        } else if collectionView == contentCollectionView {
            return CGSize(width: 364, height: 360)
        }
        return CGSize()
    }
}




//#Preview() {
//    TabbarVC()
//}
