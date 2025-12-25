//
//  MovieViewModel.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 25.12.25.
//


import Foundation

class MovieViewModel {
    
    private var movies: [Movie] = []
    private var page = 1
    var currentSearch = "ball"
    var isLoading = false
    var reloadData: (() -> Void)?
    var movieCount: Int {
         movies.count
    }

    func movie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func fetchMovies() {
        guard  !isLoading else { return }
        isLoading = true
        MoviesManager.shared.fetchMovies (page: page) { [weak self] newMovies in
            DispatchQueue.main.async {
                self?.movies.append(contentsOf: newMovies)
                self?.page += 1
                self?.isLoading = false
                self?.reloadData?()
            }
        }
    }
    func resetSearch(_ search: String) {
        currentSearch = search
        page = 1
        movies.removeAll()
        fetchMovies()
    }
}
