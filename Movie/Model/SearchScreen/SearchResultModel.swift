//
//  SearchDetailModel.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 23.06.2022.
//

import Foundation

struct SearchResultModel: Decodable, Hashable {
    let movieInfos: [MovieInfoModel]
    let totalResults: String
    let response: String
    
    enum CodingKeys: String, CodingKey {
        case movieInfos = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}
