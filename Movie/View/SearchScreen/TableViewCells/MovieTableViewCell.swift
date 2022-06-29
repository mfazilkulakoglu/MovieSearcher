//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 24.06.2022.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private let yearLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        return label
    }()
    
    private let typeLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = .systemBackground
        return label
    }()
    
    private let posterImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemBackground
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = CGRect(x: 5,
                                       y: 5,
                                       width: (contentView.width / 3) - 5,
                                       height: contentView.height - 10)
        titleLabel.frame = CGRect(x: posterImageView.right + 10,
                                  y: posterImageView.top,
                                  width: contentView.width - (posterImageView.right + 20),
                                  height: 80)
        typeLabel.frame = CGRect(x: titleLabel.left,
                                 y: posterImageView.center.y - 21,
                                 width: titleLabel.width,
                                 height: 42)
        yearLabel.frame = CGRect(x: typeLabel.left,
                                 y: posterImageView.bottom - 42,
                                 width: typeLabel.width,
                                 height: 42)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(typeLabel)
        contentView.addSubview(posterImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: MovieInfoModel) {
        self.titleLabel.text = model.title
        self.yearLabel.text = model.year
        self.typeLabel.text = "Type: \(model.type)"
        self.posterImageView.sd_setImage(with: URL(string: model.poster), placeholderImage: UIImage(systemName: "square.slash"))
        
    }
    
    
    
}
