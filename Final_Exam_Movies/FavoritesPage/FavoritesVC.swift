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
        60
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .darkGray
        return cell
        }
    }

