//
//  NoticeViewController.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 18/08/22.
//

import UIKit

class NoticeViewController: UIViewController {
    
    var newsData = [NewsData]()
    var activityView: UIActivityIndicatorView?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustonTableViewCell.self, forCellReuseIdentifier: CustonTableViewCell.identifier)
        return tableView
    }()
 

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notice"
        showActivityIndicator()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        NetworkManager.shared.getNews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                for item in response {
                    if let imageURL = item.media.first?.mediaMetadata.last?.url{
                        let data = NewsData(title: item.title, byline: item.byline, image: imageURL, url: item.url)
                        self.newsData.append(data)
                    }
                }
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                    self.hideActivityIndicator()
                }
                
            case .failure(let error):
                print("error \(error.localizedDescription)")
                self.hideActivityIndicator()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        guard let activityView = activityView else {
            return
        }
        
        self.view.addSubview(activityView)
        
        activityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityView.widthAnchor.constraint(equalToConstant: 70),
            activityView.heightAnchor.constraint(equalToConstant: 70),
            activityView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        activityView.startAnimating()
    }
    
    func hideActivityIndicator() {
        guard let activityView = activityView else {
            return
        }
        activityView.stopAnimating()
    }
}

extension NoticeViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsData.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: self.newsData[indexPath.row].url) {
            UIApplication.shared.open(url)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustonTableViewCell.identifier, for: indexPath) as! CustonTableViewCell
        
        let data = self.newsData[indexPath.row]
        cell.prepare(with: data)
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 313
    }

}

