//
//  MovieDetails.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import Foundation

struct MovieDetails: Codable {
    
    let title: String?
    let year: String?
    let rated: String?
    let runtime: String?
    let genre: String?
    let director: String?
    let writer: String?
    let actors: String?
    let plot: String?
    let language: String?
    let country: String?
    let poster: String
    let imdbID: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case poster = "Poster"
        case imdbID = "imdbID"
    }
    
}

