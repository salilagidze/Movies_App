//
//  SearchCell.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 25.12.25.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    static let identifier = "SearchCell"
    
    let posterView = UIImageView()
    let titleLabel = UILabel()
    let genreLabel = UILabel()
    let yearLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSearchUI() {
        [posterView, titleLabel, genreLabel, yearLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            posterView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterView.widthAnchor.constraint(equalToConstant: 80),
            posterView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: posterView.topAnchor),
                    titleLabel.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 12),
                    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            genreLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            yearLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 4),
            yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 10
        
        titleLabel.textColor = .white
        titleLabel.text = "Title"
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        genreLabel.textColor = .lightGray
        genreLabel.text = "Genre"
        
        yearLabel.textColor = .lightGray
        yearLabel.text = "Year"
        
    }
    
}
