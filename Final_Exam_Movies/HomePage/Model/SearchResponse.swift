//
//  SearchResponse.swift
//  Final_Exam_Movies
//
//  Created by Sali  on 24.12.25.
//

import Foundation

struct MovieSearchResponse: Codable {
    let search: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
