//
//  NewsAbstractVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 19.06.24.
//

import UIKit

class NewsAbstractVC: UIViewController {
    
    var selectedData: Results?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureNavigationBar() {
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
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
        // Kaydetme işlemleri burada yapılacak
    }
    
    @objc func shareButtonTapped() {
        // Paylaşma işlemleri burada yapılacak
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


