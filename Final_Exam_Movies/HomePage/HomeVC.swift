//
//  HomeVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class HomeVC: UIViewController {
    
    let movieTitleLael: UILabel = {
        let label = UILabel()
        label.text = "Movies"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let movieCollectionView: UICollectionView = {
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
        setupView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    func setupView() {
        movieTitleLael.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieTitleLael)
        view.addSubview(movieCollectionView)
       
        NSLayoutConstraint.activate([
            movieTitleLael.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            movieTitleLael.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            movieCollectionView.topAnchor.constraint(equalTo: movieTitleLael.bottomAnchor, constant: 5),
            movieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .darkGray
        return cell
        }
    }


import SwiftUI

#Preview {
    HomeVC()
}
