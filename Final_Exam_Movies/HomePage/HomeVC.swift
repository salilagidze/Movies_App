//
//  HomeVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class HomeVC: UIViewController {
    
    var viewModel: MovieViewModel!
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
        navigationItem.backButtonTitle = "Movies"
        viewModel = MovieViewModel()
        setupView()
        viewModel.fetchMovies()
        viewModel.reloadData = { [weak self] in
            self?.movieCollectionView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
       
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
        movieCollectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.identifier)
    }
    
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movieCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        let movie = viewModel.movie(at: indexPath.row)
        cell.titleLabel.text = movie.title
        
        if let url = URL(string: movie.poster) {
            URLSession.shared.dataTask(with: url) { (data, _, _) in
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
        let detailsVC = DetailVC()
        detailsVC.viewModel = MovieDetailsViewModel(imdbID: movie.imdbID)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    func showDetails(for movie: Movie) {
        let detailVC = DetailVC()
        detailVC.viewModel = MovieDetailsViewModel(imdbID: movie.imdbID)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
    extension HomeVC: UIScrollViewDelegate {
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let position = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let height = scrollView.frame.size.height
            
            if position > contentHeight - height {
                viewModel.fetchMovies()
            }
        }
}

