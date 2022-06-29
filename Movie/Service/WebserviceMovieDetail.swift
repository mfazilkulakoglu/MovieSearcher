//
//  File.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 26.06.2022.
//

import Foundation

class WebserviceMovieDetail {
    
    func downloadMovieInfo(searchID: String, completion: @escaping (Result<MovieDetailModel, FetchDownloadError>) -> Void) {
        let urlString = "https://www.omdbapi.com/?i=\(searchID)&apikey=291834e6&plot=full"
        print(urlString)
        let urlStr = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlStr!)!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.linkError))
            } else if let data = data {
                
                guard let searchDetails = try? JSONDecoder().decode(MovieDetailModel.self, from: data) else {
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
