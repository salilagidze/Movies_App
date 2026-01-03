//
//  FavoritesVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class FavoritesVC: UIViewController {
    
    let viewModel = FavoritesViewModel()
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
        viewModel.update = { [weak self] in
            self?.FavoritesomvieCollectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        FavoritesomvieCollectionView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        FavoritesomvieCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
    }
}

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.count()
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
            subTitleLabel.lineBreakMode = .byWordWrapping
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell
        else {
            return UICollectionViewCell()
        }
        let movie = viewModel.movie(at: indexPath.row)
        cell.titleLabel.text = movie.title
        cell.favoriteButtonTapped = { [weak self] in
            self?.viewModel.remove(at: indexPath.row)
        }
        
        if let url = URL(string: movie.poster) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.moviePoster.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movie(at: indexPath.row)
        let detailVC = DetailVC()
        detailVC.viewModel = MovieDetailsViewModel(imdbID: movie.imdbID)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

