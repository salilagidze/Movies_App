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
    let imdgIdButton = UIButton()
    let miniPoster = UIImageView()
    let movietitle = UILabel()
    let yearTitle = UILabel()
    let runTime = UILabel()
    let action = UILabel()
    let aboutMovieLabel = UILabel()
    let favoriteButton = UIButton()
    let isFavorite = false
    let divider = UIView()
    let textAbout = UILabel()
    let infoStack = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupTopView()
       
    }
    
    func setupTopView() {
        [mainMovieTitleLabel, mainPoster, miniPoster, imdgIdButton, movietitle].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            mainMovieTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            mainMovieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            mainPoster.topAnchor.constraint(equalTo: mainMovieTitleLabel.bottomAnchor, constant: 10),
            mainPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainPoster.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainPoster.heightAnchor.constraint(equalToConstant: 200),

            miniPoster.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            miniPoster.topAnchor.constraint(equalTo: mainPoster.bottomAnchor, constant: -35),
            miniPoster.widthAnchor.constraint(equalToConstant: 110),
            miniPoster.heightAnchor.constraint(equalToConstant: 130),

            movietitle.topAnchor.constraint(equalTo: mainPoster.bottomAnchor, constant: 10),
            movietitle.leadingAnchor.constraint(equalTo: miniPoster.trailingAnchor, constant: 8),
            movietitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
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
        miniPoster.backgroundColor = .red
        miniPoster.layer.cornerRadius = 20
        
        movietitle.textColor = .white
        movietitle.font = .boldSystemFont(ofSize: 18)
        movietitle.text = "Spider"
        
        infoStack.axis = .horizontal
        infoStack.spacing = 20
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(infoStack)

        infoStack.addArrangedSubview(movieInfo(icon: "calendar", text: "2024"))
        infoStack.addArrangedSubview(movieInfo(icon: "clock", text: "2h 15m"))
        infoStack.addArrangedSubview(movieInfo(icon: "film", text: "Action"))


        NSLayoutConstraint.activate([
            infoStack.topAnchor.constraint(equalTo: movietitle.bottomAnchor, constant: 80),
            infoStack.leadingAnchor.constraint(equalTo: miniPoster.trailingAnchor),
            infoStack.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
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
        iconImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.textColor = UIColor.gray.withAlphaComponent(0.5)
        textLabel.font = .systemFont(ofSize: 20)
        
        stack.addArrangedSubview(iconImageView)
        stack.addArrangedSubview(textLabel)
        
        return stack

    }

}
