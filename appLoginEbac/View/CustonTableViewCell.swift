//
//  CustonTableViewCell.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 20/08/22.
//

import UIKit

class CustonTableViewCell: UITableViewCell {

    static let identifier:String = "CustomTableViewCell"
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 6
        return label
    }()
    
    private let imageNews: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 6
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
        contentView.addSubview(imageNews)
        contentView.addSubview(author)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            title.heightAnchor.constraint(equalToConstant: 36),
            
            imageNews.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            imageNews.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            imageNews.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            imageNews.heightAnchor.constraint(equalToConstant: 220),
            
            author.topAnchor.constraint(equalTo: imageNews.bottomAnchor, constant: 10),
            author.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            author.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            author.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
}


extension CustonTableViewCell {
    
    func prepare(with news: NewsData) {
        
        title.text = news.title
        author.text = news.byline
        
        guard let urlImage = URL(string: news.image) else {return}
        
        URLSession.shared.dataTask(with: urlImage) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.imageNews.image = UIImage(data: data)
            }
        }.resume()
    }
    
}

