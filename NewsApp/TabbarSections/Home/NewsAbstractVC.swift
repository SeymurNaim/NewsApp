//
//  NewsAbstractVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 19.06.24.
//

import UIKit
import RealmSwift

class NewsAbstractVC: UIViewController {

    var selectedData: Resultss?
    var tableView: UITableView!
    var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
        updateSaveButtonState()
    }

    private func configureNavigationBar() {
        saveButton = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(saveButtonTapped))

        let shareButton = UIBarButtonItem(image: UIImage(systemName: "person.2"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(shareButtonTapped))

        navigationItem.rightBarButtonItems = [saveButton, shareButton]
    }

    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AbstractCell.self, forCellReuseIdentifier: "AbstractCell")
        view.addSubview(tableView)
    }

    @objc func saveButtonTapped() {
        guard let data = selectedData else { return }

        let realm = try! Realm()
        
        if let existingItem = realm.objects(SavedNews.self).filter("title == %@", data.title ?? "").first {
            try! realm.write {
                realm.delete(existingItem)
            }
            saveButton.image = UIImage(systemName: "bookmark")
        } else {
            let newsItem = SavedNews()
            newsItem.title = data.title ?? ""
            newsItem.publishedDate = data.published_date ?? ""
            newsItem.imageURL = data.multimedia?.first?.url ?? ""

            try! realm.write {
                realm.add(newsItem)
            }
            saveButton.image = UIImage(systemName: "bookmark.fill")
        }
        NotificationCenter.default.post(name: NSNotification.Name("NewsSaved"), object: nil)

        let alert = UIAlertController(title: "Durum", message: "Haber durumu güncellendi.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @objc func shareButtonTapped() {
        // Paylaşma işlemleri burada yapılacak
    }

    private func updateSaveButtonState() {
        guard let data = selectedData else { return }

        let realm = try! Realm()
        if realm.objects(SavedNews.self).filter("title == %@", data.title ?? "").first != nil {
            saveButton.image = UIImage(systemName: "bookmark.fill")
        } else {
            saveButton.image = UIImage(systemName: "bookmark")
        }
    }
}

extension NewsAbstractVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedData == nil ? 0 : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AbstractCell", for: indexPath) as! AbstractCell
        cell.newsTitle.text = "\(selectedData?.title ?? "")"
        cell.newsAbstract.text = "\(selectedData?.abstract ?? "")"
        cell.publishedDate.text = "\(selectedData?.published_date ?? "")"

        if let data = selectedData {
            cell.configure(with: data)
        }

        return cell
    }
}



