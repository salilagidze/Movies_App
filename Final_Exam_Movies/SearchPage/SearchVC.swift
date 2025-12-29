//
//  SearchVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class SearchVC: UIViewController {
    
    var searchedMovies: [Movie] = []
    let searchTitle = UILabel()
    let searchBar = UISearchBar()
    let menuButton = UIButton(type: .system)
    let searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 30, height: 140)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupSearch()
        setupMenu()
        
        searchBar.delegate = self
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
        searchedMovies = []
    }
    
    func setupSearch() {
        [searchTitle, searchBar, menuButton, searchCollectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            searchTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            searchTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            searchBar.topAnchor.constraint(equalTo: searchTitle.bottomAnchor, constant: 12),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            searchBar.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -8),
            
            menuButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor,constant: 2),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            menuButton.widthAnchor.constraint(equalToConstant: 50),
            menuButton.heightAnchor.constraint(equalToConstant: 50),
            
            searchCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            searchCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        searchTitle.text = "Search"
        searchTitle.font = .boldSystemFont(ofSize: 40)
        searchTitle.textColor = .white
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search Movies"
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.tintColor = .white
        
        menuButton.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        menuButton.tintColor = .lightGray
        
        
    }
    
    func setupMenu() {
        let menu = UIMenu(children: [
            UIAction(title: "Name") { _ in
                print("Sort by Name")
            },
            UIAction(title: "Genre") { _ in
                print("Sort by Genre")
            },
            UIAction(title: "Year") { _ in
                print("Sort by Year")
            }
            
        ])
        
        menuButton.menu = menu
        menuButton.showsMenuAsPrimaryAction = true
    }
    
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            searchedMovies = []
            searchCollectionView.reloadData()
            return
        }
        
        MoviesManager.shared.fetchMovies(search: searchText, page: 1) { [weak self] movies in
            DispatchQueue.main.async {
                self?.searchedMovies = movies
                self?.searchCollectionView.reloadData()
            }
        }
    }
}
extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        searchedMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SearchCell.identifier,
            for: indexPath
        ) as! SearchCell
        
        let movie = searchedMovies[indexPath.item]
        cell.titleLabel.text = movie.title
        cell.genreLabel.text = movie.type
        cell.yearLabel.text = movie.year
        
        if let url = URL(string: movie.poster) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.posterView.image = UIImage(data: data)
                    }
                }
            }.resume()
        } else {
            cell.posterView.image = nil
        }
        
        return cell
    }
    
}
