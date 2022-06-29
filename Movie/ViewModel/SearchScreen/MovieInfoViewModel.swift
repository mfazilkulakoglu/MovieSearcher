//
//  MovieInfoViewModel.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 24.06.2022.
//

import Foundation

struct MovieInfoViewModel {
    
    let movieInfo: MovieInfoModel
    
    var title: String {
        return self.movieInfo.title
    }
    
    var year: String {
        return self.movieInfo.year
    }
    
    var imdbID: String {
        return self.movieInfo.imdbID
    }
    
    var type: String {
        return self.movieInfo.type
    }
    
    var poster: String {
        return self.movieInfo.poster
    }
    
}
