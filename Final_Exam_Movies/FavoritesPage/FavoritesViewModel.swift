//
//  FavoritesViewModel.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 02.01.26.
//

import Foundation

class FavoritesViewModel {
    
    var update: (() -> Void)?
    
    func count() -> Int {
        MoviesManager.shared.getFavMovies().count
    }
    
    func movie(at index: Int) -> Movie {
        MoviesManager.shared.getFavMovies()[index]
    }

    func remove(at index: Int) {
        let movie = movie(at: index)
        MoviesManager.shared.removeFavoriteMovie(movie)
        update?()
    }
}
