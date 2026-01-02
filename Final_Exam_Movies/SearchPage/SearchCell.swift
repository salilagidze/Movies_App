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
    let infoStackView = UIStackView()
    let ratingLabel = UILabel()
    let actionLabel = UILabel()
    let yearLabel = UILabel()
    let runTimeLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSearchUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSearchUI() {
        [posterView, titleLabel, infoStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        infoStackView.axis = .vertical
        infoStackView.spacing = 4
        infoStackView.alignment = .leading
        
        NSLayoutConstraint.activate([
            
            posterView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            posterView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            posterView.widthAnchor.constraint(equalToConstant: 80),
            posterView.heightAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: posterView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            infoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            infoStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            infoStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10)
        ])
        
        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 10
        
        titleLabel.textColor = .white
        titleLabel.text = "Title"
        titleLabel.font = .boldSystemFont(ofSize: 15)
        
        infoStackView.addArrangedSubview(movieInfo(icon: "star", label: ratingLabel, iconColor: .systemOrange))
        infoStackView.addArrangedSubview(movieInfo(icon: "film", label: actionLabel))
        infoStackView.addArrangedSubview(movieInfo(icon: "calendar", label: yearLabel))
        infoStackView.addArrangedSubview(movieInfo(icon: "clock", label: runTimeLabel))
        
        
    }
    func movieInfo(icon: String, label: UILabel, iconColor: UIColor = .gray) -> UIView {
        let iconView = UIImageView(image: UIImage(systemName: icon))
        iconView.tintColor = iconColor
        iconView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        
        let stack = UIStackView(arrangedSubviews: [iconView, label])
        stack.axis = .horizontal
        stack.spacing = 6
        stack.alignment = .center
        return stack
    }
    
    func configure(movie: Movie, details: MovieDetails?) {
        titleLabel.text = movie.title
        yearLabel.text = movie.year
        ratingLabel.text = details?.imdbRating
        actionLabel.text = details?.genre
        runTimeLabel.text = details?.runtime
    }
        
}
