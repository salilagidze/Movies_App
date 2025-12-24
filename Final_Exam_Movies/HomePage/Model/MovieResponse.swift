//
//  MovieResponse.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    
    init(title: String, year: String, imdbID: String, type: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
    }
}

