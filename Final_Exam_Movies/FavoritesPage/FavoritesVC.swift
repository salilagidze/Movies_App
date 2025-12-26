//
//  FavoritesVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class FavoritesVC: UIViewController {
    
    let favoritesLabel: UILabel = {
        let favoriteLabel = UILabel()
        favoriteLabel.text = "Favorites"
        favoriteLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        favoriteLabel.textColor = .white
        return favoriteLabel
    }()
    
    let FavoritesomvieCollectionView: UICollectionView = {
        let configuration = UICollectionViewFlowLayout()
        configuration.scrollDirection = .vertical
        configuration.itemSize = CGSize(width: 110, height: 195)
        configuration.minimumLineSpacing = 20
        configuration.minimumInteritemSpacing = 13
        configuration.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: configuration)
        collection.backgroundColor = .black
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func setupCollectionView() {
        favoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        FavoritesomvieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(favoritesLabel)
        view.addSubview(FavoritesomvieCollectionView)
        
        NSLayoutConstraint.activate([
            favoritesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            favoritesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            FavoritesomvieCollectionView.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor, constant: 5),
            FavoritesomvieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            FavoritesomvieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            FavoritesomvieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        FavoritesomvieCollectionView.dataSource = self
        FavoritesomvieCollectionView.delegate = self
        FavoritesomvieCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = MoviesManager.shared.getFavMovies().count
        if count == 0 {
            let container = UIView(frame: collectionView.bounds)
            
            let titleLabel = UILabel()
            titleLabel.text = "No Favorites Yet"
            titleLabel.textColor = .white
            titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
            titleLabel.textAlignment = .center
            let subTitleLabel = UILabel()
            subTitleLabel.text = "All movies marked as favorite will be added here"
            subTitleLabel.numberOfLines = 0
            subTitleLabel.textColor = .lightGray
            subTitleLabel.textAlignment = .center
            let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
            stackView.alignment = .center
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: container.leadingAnchor, constant: 15),
                stackView.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -15)
            ])
            collectionView.backgroundView = container
        } else {
            collectionView.backgroundView = nil
            
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .darkGray
        return cell
    }
}

