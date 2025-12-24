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
    let searchButton = UIButton()    
    var searCollectionView: UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

    }
    
}
