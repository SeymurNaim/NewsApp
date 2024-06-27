//
//  SearchVC.swift
//  NewsApp
//
//  Created by Seymur Naim on 30.05.24.
//


import UIKit

class SearchVC: UIViewController {

    var newsData: [Resultss] = []
    var filteredNews: [Resultss] = []

    var searchBar: UISearchBar = {
        var search = UISearchBar()
        search.placeholder = "Search news"
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setup()
        fetchNewsData()
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchContentCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setup() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(searchBar)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
    
    private func fetchNewsData() {
         let apiManager = ApiManager()
         let categories: [TopStoryCategory] = [.world, .usa, .science, .arts]
         let dispatchGroup = DispatchGroup()

         var allNewsResults: [Resultss] = []

         categories.forEach { category in
             dispatchGroup.enter()
             apiManager.fetchData(for: category) { [weak self] data, error in
                 guard let self = self, let news = data else {
                     dispatchGroup.leave()
                     return
                 }
                 allNewsResults.append(contentsOf: news.results)
                 dispatchGroup.leave()
             }
         }

         dispatchGroup.notify(queue: .main) { [weak self] in
             self?.newsData = allNewsResults
             self?.filteredNews = allNewsResults
             self?.tableView.reloadData()
         }
     }}


extension SearchVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchContentCell
        let newsItem = filteredNews[indexPath.row]
        cell.configureCell(withImage: newsItem.multimedia?.first?.url ?? "")
        cell.newsTitle.text = newsItem.title
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredNews = newsData
        } else {
            filteredNews = newsData.filter { $0.title?.contains(searchText) ?? false }
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndexx = indexPath.item
        let vc = NewsAbstractVC()
        vc.selectedData = filteredNews[selectedIndexx]
        navigationController?.show(vc, sender: nil)
    }
}
