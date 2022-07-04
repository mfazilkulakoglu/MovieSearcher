//
//  File.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 23.06.2022.
//

import Foundation
import UIKit

class WebserviceMovieList {
    
    func downloadMovieInfo(searchTitle: String, page: String, completion: @escaping (Result<SearchResultModel, FetchDownloadError>) -> Void) {
        let urlString = "https://www.omdbapi.com/?s=\(searchTitle)&apikey=291834e6&plot=full&page=\(page)"
        let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.linkError))
            } else if let data = data {
                
                guard let searchDetails = try? JSONDecoder().decode(SearchResultModel.self, from: data) else {
                    completion(.failure(.parseError))
                    return
                }
                
                completion(.success(searchDetails))
                
            } else {
                completion(.failure(.downloadError))
            }
        }.resume()
    }
    
    enum FetchDownloadError: Error {
        case linkError
        case downloadError
        case parseError
    }
}



