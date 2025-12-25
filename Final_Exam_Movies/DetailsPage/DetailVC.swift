//
//  DetailVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class DetailVC: UIViewController {
    
    let mainMovieTitleLabel = UILabel()
    let mainPoster = UIImageView()
    let miniPoster = UIImageView()
    let movietitle = UILabel()
    let yearTitle = UILabel()
    let runTime = UILabel()
    let action = UILabel()
    let divider = UIView()
    let aboutMovieLabel = UILabel()
    let favoriteButton = UIButton()
    var isFavorite = false
    let divider2 = UIView()
    let textAbout = UILabel()
    let infoStack = UIStackView()
    let imdbRatingView = UIView()
    let ratingIcon = UIImageView()
    let ratingLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupTopView()
        setupBottomView()
        
    }
    
    func setupTopView() {
        [mainMovieTitleLabel, mainPoster, miniPoster, imdbRatingView, ratingIcon, ratingLabel, movietitle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
            imdbRatingView.addSubview(ratingIcon)
            imdbRatingView.addSubview(ratingLabel)
        }
        NSLayoutConstraint.activate([
            mainMovieTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            mainMovieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainPoster.topAnchor.constraint(equalTo: mainMovieTitleLabel.bottomAnchor, constant: 10),
            mainPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainPoster.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainPoster.heightAnchor.constraint(equalToConstant: 200),
            
            miniPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            miniPoster.topAnchor.constraint(equalTo: mainPoster.bottomAnchor, constant: -75),
            miniPoster.widthAnchor.constraint(equalToConstant: 110),
            miniPoster.heightAnchor.constraint(equalToConstant: 150),
            
            movietitle.topAnchor.constraint(equalTo: mainPoster.bottomAnchor, constant: 10),
            movietitle.leadingAnchor.constraint(equalTo: miniPoster.trailingAnchor, constant: 8),
            movietitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            imdbRatingView.bottomAnchor.constraint(equalTo: mainPoster.bottomAnchor, constant: -12),
            imdbRatingView.trailingAnchor.constraint(equalTo: mainPoster.trailingAnchor, constant: -12),
            imdbRatingView.heightAnchor.constraint(equalToConstant: 32),
            imdbRatingView.widthAnchor.constraint(greaterThanOrEqualToConstant: 70),
            
            ratingIcon.leadingAnchor.constraint(equalTo: imdbRatingView.leadingAnchor, constant: 8),
            ratingIcon.centerYAnchor.constraint(equalTo: imdbRatingView.centerYAnchor),
            ratingIcon.widthAnchor.constraint(equalToConstant: 24),
            ratingIcon.heightAnchor.constraint(equalToConstant: 24),
            
            ratingLabel.leadingAnchor.constraint(equalTo: ratingIcon.trailingAnchor, constant: 4),
            ratingLabel.trailingAnchor.constraint(equalTo: imdbRatingView.trailingAnchor, constant: -8),
            ratingLabel.centerYAnchor.constraint(equalTo: imdbRatingView.centerYAnchor),
            
            
        ])
        
        mainMovieTitleLabel.textColor = .white
        mainMovieTitleLabel.textAlignment = .center
        mainMovieTitleLabel.text = "Movie Title"
        mainMovieTitleLabel.font = .boldSystemFont(ofSize: 25)
        
        mainPoster.contentMode = .scaleAspectFill
        mainPoster.clipsToBounds = true
        mainPoster.backgroundColor = .red
        mainPoster.layer.masksToBounds = true
        mainPoster.layer.cornerRadius = 20
        mainPoster.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
        
        miniPoster.clipsToBounds = true
        miniPoster.backgroundColor = .gray
        miniPoster.layer.cornerRadius = 20
        
        movietitle.textColor = .white
        movietitle.font = .boldSystemFont(ofSize: 22)
        movietitle.text = "Spider"
        
        imdbRatingView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        imdbRatingView.layer.cornerRadius = 10
        
        ratingIcon.image = UIImage(systemName: "star")
        ratingIcon.tintColor = .systemOrange
        
        ratingLabel.text = "--"
        ratingLabel.textColor = .systemOrange
        ratingLabel.font = .systemFont(ofSize: 18)
        
        infoStack.axis = .horizontal
        infoStack.spacing = 15
        infoStack.distribution = .fill
        infoStack.alignment = .center
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoStack)
        
        infoStack.addArrangedSubview(movieInfo(icon: "calendar", text: "2024"))
        infoStack.addArrangedSubview(makeDivider())
        infoStack.addArrangedSubview(movieInfo(icon: "clock", text: "145 Minutes"))
        infoStack.addArrangedSubview(makeDivider())
        infoStack.addArrangedSubview(movieInfo(icon: "film", text: "Action"))
        
        
        
        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: miniPoster.bottomAnchor, constant: 15),
            infoStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoStack.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -15),
            infoStack.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 15)

        ])
        
    }
    
    func movieInfo(icon: String, text: String) -> UIView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        
        let iconImageView = UIImageView(image: UIImage(systemName: icon))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .lightGray
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.textColor = UIColor.gray.withAlphaComponent(0.6)
        textLabel.font = .systemFont(ofSize: 17)
        textLabel.numberOfLines = 1
        
        stack.addArrangedSubview(iconImageView)
        stack.addArrangedSubview(textLabel)
        
        return stack
        
    }
    
    func makeDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = .lightGray
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 15),
            divider.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        return divider
    }
    
    func setupBottomView() {
        [aboutMovieLabel, favoriteButton, divider2, textAbout].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            aboutMovieLabel.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 50),
            aboutMovieLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            favoriteButton.centerYAnchor.constraint(equalTo: aboutMovieLabel.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favoriteButton.widthAnchor.constraint(equalToConstant: 50),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50),
            
            divider2.topAnchor.constraint(equalTo: aboutMovieLabel.bottomAnchor, constant: 8),
            divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            
            textAbout.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 12),
            textAbout.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textAbout.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
        
        aboutMovieLabel.text = "About Movie"
        aboutMovieLabel.font = .boldSystemFont(ofSize: 25)
        aboutMovieLabel.textColor = .white
        
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.tintColor = .systemGray
        favoriteButton.addTarget(self, action: #selector(favoritesTapped), for: .touchUpInside)
        
        divider2.backgroundColor = .systemGray
        
        textAbout.text = "ajafakjfbjavjsv"
        textAbout.numberOfLines = 0
        textAbout.textColor = .systemGray
        
    }
    
    @objc private func favoritesTapped() {
        isFavorite.toggle()
        
        let imageName = isFavorite ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
        favoriteButton.tintColor = isFavorite ? .systemRed : .systemGray
        
        UIView.animate(withDuration: 0.2, animations: {
            self.favoriteButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.favoriteButton.transform = .identity
            }
            
        })
    }
}
