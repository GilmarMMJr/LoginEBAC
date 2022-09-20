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
//        label.text = "2 Men Convicted of Killing Malcolm X Will Be Exonerated After Decade"
        label.numberOfLines = 6
//        label.layer.borderWidth = 2
        return label
    }()
    
    private let imageNews: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "SoResenha")
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
//        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    private let author: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
//        label.text = "By Ashley Southall and Jonah E. Bromwich"
        label.numberOfLines = 6
//        label.layer.borderWidth = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .gray
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
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            self.title.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            self.title.heightAnchor.constraint(equalToConstant: 36),
            
            self.imageNews.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 5),
            self.imageNews.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            self.imageNews.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            self.imageNews.heightAnchor.constraint(equalToConstant: 220),
            
            self.author.topAnchor.constraint(equalTo: self.imageNews.bottomAnchor, constant: 10),
            self.author.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            self.author.trailingAnchor.constraint(equalTo: self.title.trailingAnchor),
            self.author.heightAnchor.constraint(equalToConstant: 18)
            
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

