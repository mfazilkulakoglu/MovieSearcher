//
//  MoviDetailViewModel.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 26.06.2022.
//

import Foundation

struct MovieDetailViewModel {
    
    let movieDetail: MovieDetailModel
    
    var title: String? {
        self.movieDetail.title
    }
    
    var year: String? {
        self.movieDetail.year
    }
    
    var rated: String? {
        self.movieDetail.rated
    }
    
    var released: String? {
        self.movieDetail.released
    }
    
    var runTime: String? {
        self.movieDetail.runTime
    }
    
    var genre: String? {
        self.movieDetail.genre
    }
    
    var director: String? {
        self.movieDetail.director
    }
    
    var writer: String? {
        self.movieDetail.writer
    }
    
    var actors: String? {
        self.movieDetail.actors
    }
    
    var plot: String? {
        self.movieDetail.plot
    }
    
    var language: String? {
        self.movieDetail.language
    }
    
    var country: String? {
        self.movieDetail.country
    }
    
    var awards: String? {
        self.movieDetail.awards
    }
    
    var poster: String {
        self.movieDetail.poster
    }
    
    var ratings: [[String : String]]? {
        self.movieDetail.ratings
    }
    
    var metaScore: String? {
        self.movieDetail.metaScore
    }
    
    var imdbRatings: String? {
        self.movieDetail.imdbRating
    }
    
    var imdbVotes: String? {
        self.movieDetail.imdbVotes
    }
    
    var imdbID: String? {
        self.movieDetail.imdbID
    }
    
    var type: String? {
        self.movieDetail.type
    }
    
    var dvd: String? {
        self.movieDetail.dvd
    }
    
    var boxOffice: String? {
        self.movieDetail.boxOffice
    }
    
    var production: String? {
        self.movieDetail.production
    }
    
    var website: String? {
        self.movieDetail.website
    }
    
    var response: String? {
        self.movieDetail.response
    }
    
}

