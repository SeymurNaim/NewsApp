//
//  BasketVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//

import UIKit
import RealmSwift

class BasketVC: UIViewController {

    var tableView: UITableView!
    var savedNews: Results<SavedNews>?
    
    let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let emptyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BasketImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Saved News"
        configureTableView()
        fetchSavedNews()
        configureEmptyView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchSavedNews), name: NSNotification.Name("NewsSaved"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchSavedNews()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasketCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func configureEmptyView() {
        view.addSubview(emptyView)
        emptyView.addSubview(emptyImage)

        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            emptyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyImage.heightAnchor.constraint(equalToConstant: 400),
            emptyImage.widthAnchor.constraint(equalToConstant: 360)
        ])
    }

    @objc private func fetchSavedNews() {
        let realm = try! Realm()
        savedNews = realm.objects(SavedNews.self)
        tableView.reloadData()
        checkIfEmpty()
    }
    
    private func checkIfEmpty() {
        emptyView.isHidden = (savedNews?.isEmpty == false)
    }
}

extension BasketVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedNews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasketCell
        if let newsItem = savedNews?[indexPath.row] {
            cell.newsTitle.text = newsItem.title
            cell.configureCell(withImage: newsItem.imageURL)
            cell.publishedDate.text = newsItem.publishedDate
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let newsItemToDelete = savedNews?[indexPath.row] {
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(newsItemToDelete)
                }
                tableView.deleteRows(at: [indexPath], with: .fade)
                checkIfEmpty()
            }
        }
    }
}



