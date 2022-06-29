//
//  MovieListModel.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 23.06.2022.
//

import Foundation

struct MovieInfoModel: Decodable, Hashable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
