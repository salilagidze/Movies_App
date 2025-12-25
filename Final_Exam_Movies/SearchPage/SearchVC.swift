//
//  SearchVC.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import UIKit

class SearchVC: UIViewController {
    
    let searchTitle = UILabel()
    let searchBar = UISearchBar()
    let menuButton = UIButton(type: .system)
    let searchCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupSearch()
        setupMenu()
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
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
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

