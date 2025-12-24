//
//  FvoritesCell.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 25.12.25.
//

import UIKit

class FvoritesCell: UICollectionViewCell {
    
    static let identifier: String = "MoviesCollectionViewCell"
    
    let titleLabel = UILabel()
    let moviePoster = UIImageView()
    let getDetailsButton = UIButton(type: .system)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
            contentView.backgroundColor = .black
            contentView.layer.cornerRadius = 10
            contentView.clipsToBounds = true
        [titleLabel, moviePoster, getDetailsButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: contentView.topAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moviePoster.heightAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.70),
            titleLabel.topAnchor.constraint(equalTo: moviePoster.bottomAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
    ])
        moviePoster.clipsToBounds = true
        moviePoster.layer.cornerRadius = 15
        moviePoster.contentMode = .scaleAspectFill
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 12, weight: .medium)
        
     
  }
    
}
