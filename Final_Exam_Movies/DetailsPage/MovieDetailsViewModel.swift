//
//  MovieDetailsViewModel.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 25.12.25.
//

import UIKit

class MovieDetailsViewModel {
    
    private(set) var movie: MovieDetails?
    var onUpdate: (() -> Void)?
    
    let imdbID: String
    
    init(imdbID: String) {
        self.imdbID = imdbID
    }
    
    func fetchDetails() {
        let urlString = "https://www.omdbapi.com/?apikey=fd67c604&i=\(imdbID)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            if let result = try? JSONDecoder().decode(MovieDetails.self, from: data) {
                DispatchQueue.main.async {
                    self.movie = result
                    self.onUpdate?()
                }
            }
        }.resume()
    }
}
