//
//  MoviesManager.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 25.12.25.
//


import Foundation


class MoviesManager {
    static let shared = MoviesManager()
    private init() {}
    private var favoriteMovies: [Movie] = []
    let queue = DispatchQueue(label: "favorites.queue", attributes: .concurrent)
    
    func fetchMovies(page: Int, completion: @escaping ([Movie]) -> Void) {
        let urlString = "https://www.omdbapi.com/?apikey=fd67c604&s=ball&type=movie&(page)"
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                
                completion([])
                return
            }
            
            do {
                let result = try JSONDecoder().decode(MovieSearchResponse.self, from: data)
                completion(result.search ?? [])
            } catch {
                print(error)
                completion([])
            }
        }.resume()
    }
    
    func getFavMovies() -> [Movie] {
        return queue.sync {
            favoriteMovies
        }
    }
    
    func addFavoriteMovie(_ movie: Movie) {
        if  !favoriteMovies.contains(where: { $0.imdbID == movie.imdbID }) {
            favoriteMovies.append(movie)
            
        }
    }
    
    func removeFavoriteMovie(_ movie: Movie) {
        favoriteMovies.removeAll { $0.imdbID == movie.imdbID }
    }
    
    func isFavoriteMovie(_ movie: Movie) -> Bool {
        return queue.sync {
            favoriteMovies.contains { $0.imdbID == movie.imdbID }
        }
       
    }
 
}


