//
//  SearchViewModel.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 02.01.26.
//

import Foundation

class SearchViewModel {
    
    var movies: [Movie] = []
    var update: (() -> Void)?
    
    var isAscending = true
    
    func search(text:String) {
        if text.isEmpty {
            movies = []
            update?()
            return
        }
        
        MoviesManager.shared.fetchMovies(search: text, page: 1) { [weak self] movies in
            DispatchQueue.main.async {
                self?.movies = movies
                self?.update?()
            }
        }
    }
//    movies მასივში რამდენი ფილმია რომ დამიბრუნდეს
    func count() -> Int {
        movies.count
    }
//    ინდექსი რომ აიღოს და ისე დამიბრუნოს ფილმები
    func movie(at index: Int) -> Movie {
        movies[index]
    }
    
    func sortByName() {
        movies.sort { $0.title.lowercased() < $1.title.lowercased() }
        update?()
    }
    func sortByNameAlpha() {
        movies.sort { isAscending ? $0.title < $1.title : $0.title > $1.title
        }
        update?()
    }
    func sortByYear() {
        movies.sort { $0.year < $1.year }
        update?()
    }
}

