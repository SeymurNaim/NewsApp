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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        fetchSavedNews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchSavedNews), name: NSNotification.Name("NewsSaved"), object: nil)
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

    @objc private func fetchSavedNews() {
        let realm = try! Realm()
        savedNews = realm.objects(SavedNews.self)
        tableView.reloadData()
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
            }
        }
    }
}




