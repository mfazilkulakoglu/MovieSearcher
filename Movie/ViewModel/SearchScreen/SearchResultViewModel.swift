//
//  MovieViewModel.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 23.06.2022.
//

import Foundation

struct SearchResultViewModel {
    
    let movieList: SearchResultModel
    
    var movieInfoList: [MovieInfoModel] {
        return self.movieList.movieInfos
    }
    
    var totalResults: String {
        return self.movieList.totalResults
    }
    
    var response: String {
        return self.movieList.response
    }
    
    var pageCount: Int {
        let totalresultInt = Int(totalResults)
        return (totalresultInt! / 10 + 1)
    }
    
    var lastPageContent: Int {
        let totalresultInt = Int(totalResults)
        return (totalresultInt! % 10)
    }
    
    func numberOfRowsInSection() -> Int {
        return self.movieInfoList.count
    }
    
    func movieInfoAtIndex(_ index: Int) -> MovieInfoViewModel {
        let movieInfo = self.movieInfoList[index]
        return MovieInfoViewModel(movieInfo: movieInfo)
    }
    
}
