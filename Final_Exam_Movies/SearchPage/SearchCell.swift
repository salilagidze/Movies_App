//
//  SearchCell.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 25.12.25.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    static let identifier = "SearchCell"
    
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
        [titleLabel, genreLabel, yearLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
            NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
             titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        
             genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
             genreLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

             yearLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 4),
             yearLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
             yearLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
             ])
            
            contentView.backgroundColor = UIColor(white: 0.20, alpha: 1)
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
