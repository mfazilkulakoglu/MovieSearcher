//
//  ShowDetail.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 28.06.2022.
//

import Foundation
import UIKit
import TinyConstraints

class ShowDetailViewController: UIViewController {
    
    private let labelFont = UIFont.systemFont(ofSize: 16)
    
    
    private let loadingAnimation: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.sizeThatFits(CGSize(width: 150, height: 150))
        return activity
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Year"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var yearTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let ratedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Rated"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var ratedTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let releasedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Released"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var releasedTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let runTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Runtime"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var runTimeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Genre"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var genreTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = labelFont
        label.numberOfLines = 0
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Director"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var directorTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = labelFont
        label.numberOfLines = 0
        return label
    }()
    
    private let writerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Writer"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var writerTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = labelFont
        label.numberOfLines = 0
        return label
    }()
    
    private let actorsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Actors"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var actorsTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = labelFont
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var plotLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Plot"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var plotTextLabel: UILabel = {
        let label = UILabel()
        label.font = labelFont
        label.numberOfLines = 0
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Language"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var languageTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Country"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var countryTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = labelFont
        label.numberOfLines = 0
        return label
    }()
    
    private let awardsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Awards"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var awardsTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let metaScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Metascore"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var metaScoreTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let imdbRatingsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "IMDB Ratings"
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        return label
    }()
    
    private lazy var imdbRatingsTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let imdbVotesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "IMDB Votes"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var imdbVotesTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Type"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var typeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let dvdLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "DVD"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var dvdTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let boxOfficeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "BoxOffice"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var boxOfficeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let productionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Production"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var productionTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Website"
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    private lazy var websiteTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = labelFont
        return label
    }()
    
    private var movieDetailViewModel: MovieDetailViewModel!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 49.0
        loadingAnimation.center = view.center
        scrollView.frame = CGRect(x: 0,
                                  y: 2 * tabBarHeight + 10,
                                  width: view.width,
                                  height: view.height - (2 * tabBarHeight + 10))
        posterImage.frame = CGRect(x: 20,
                                   y: 20,
                                   width: scrollView.width - 40,
                                   height: view.height - 300)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loadingAnimation)
        loadingAnimation.startAnimating()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(dismissDetail))
        DispatchQueue.main.async { [self] in
            
            addSubviews()
            
            loadingAnimation.stopAnimating()
            loadingAnimation.removeFromSuperview()
            
            view.addSubview(scrollView)
            
        }
    }
    
    init(id: String) {
        super.init(nibName: nil, bundle: nil)
        
        WebserviceMovieDetail().downloadMovieInfo(searchID: id) { result in
            switch result {
            case .failure(let error):
                self.makeAlert(title: "Error", message: "\(error.self)")
            case .success(let model):
                
                
                DispatchQueue.main.async {
                    self.movieDetailViewModel = MovieDetailViewModel(movieDetail: model)
                    Task {
                        self.loadData(model: self.movieDetailViewModel)
                        self.setConstraints()
                    }
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissDetail() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    func addSubviews() {
        
        scrollView.addSubview(posterImage)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(yearLabel)
        scrollView.addSubview(yearTextLabel)
        scrollView.addSubview(ratedLabel)
        scrollView.addSubview(ratedTextLabel)
        scrollView.addSubview(releasedLabel)
        scrollView.addSubview(releasedTextLabel)
        scrollView.addSubview(runTimeLabel)
        scrollView.addSubview(runTimeTextLabel)
        scrollView.addSubview(genreLabel)
        scrollView.addSubview(genreTextLabel)
        scrollView.addSubview(directorLabel)
        scrollView.addSubview(directorTextLabel)
        scrollView.addSubview(writerLabel)
        scrollView.addSubview(writerTextLabel)
        scrollView.addSubview(actorsLabel)
        scrollView.addSubview(actorsTextLabel)
        scrollView.addSubview(plotLabel)
        scrollView.addSubview(plotTextLabel)
        scrollView.addSubview(languageLabel)
        scrollView.addSubview(languageTextLabel)
        scrollView.addSubview(countryLabel)
        scrollView.addSubview(countryTextLabel)
        scrollView.addSubview(awardsLabel)
        scrollView.addSubview(awardsTextLabel)
        scrollView.addSubview(metaScoreLabel)
        scrollView.addSubview(metaScoreTextLabel)
        scrollView.addSubview(imdbRatingsLabel)
        scrollView.addSubview(imdbRatingsTextLabel)
        scrollView.addSubview(imdbVotesLabel)
        scrollView.addSubview(imdbVotesTextLabel)
        scrollView.addSubview(typeLabel)
        scrollView.addSubview(typeTextLabel)
        scrollView.addSubview(dvdLabel)
        scrollView.addSubview(dvdTextLabel)
        scrollView.addSubview(boxOfficeLabel)
        scrollView.addSubview(boxOfficeTextLabel)
        scrollView.addSubview(productionLabel)
        scrollView.addSubview(productionTextLabel)
        scrollView.addSubview(websiteLabel)
        scrollView.addSubview(websiteTextLabel)
        
    }
    
    func loadData(model: MovieDetailViewModel) {
        
        self.posterImage.sd_setImage(with: URL(string: model.poster),
                                     placeholderImage: UIImage(systemName: "square.slash"))
        self.titleLabel.text = model.title
        self.yearTextLabel.text = "\(model.year ?? "N/A")"
        self.ratedTextLabel.text = "\(model.rated ?? "N/A")"
        self.releasedTextLabel.text = "\(model.released ?? "N/A")"
        self.runTimeTextLabel.text = "\(model.runTime ?? "N/A")"
        self.genreTextLabel.text = "\(model.genre ?? "N/A")"
        self.directorTextLabel.text = "\(model.director ?? "N/A")"
        self.writerTextLabel.text = "\(model.writer ?? "N/A")"
        self.actorsTextLabel.text = "\(model.actors ?? "N/A")"
        self.plotTextLabel.text = "\(model.plot ?? "N/A")"
        self.languageTextLabel.text = "\(model.language ?? "N/A")"
        self.countryTextLabel.text = "\(model.country ?? "N/A")"
        self.awardsTextLabel.text = "\(model.awards ?? "N/A")"
        self.metaScoreTextLabel.text = "\(model.metaScore ?? "N/A")"
        self.imdbRatingsTextLabel.text = "\(model.imdbRatings ?? "N/A")"
        self.imdbVotesTextLabel.text = "\(model.imdbVotes ?? "N/A")"
        self.typeTextLabel.text = "\(model.type ?? "N/A")"
        self.dvdTextLabel.text = "\(model.dvd ?? "N/A")"
        self.boxOfficeTextLabel.text = "\(model.boxOffice ?? "N/A")"
        self.productionTextLabel.text = "\(model.production ?? "N/A")"
        self.websiteTextLabel.text = "\(model.website ?? "N/A")"
    }
    
    func setConstraints() {
        
        setTopLabelsConstraints(label: titleLabel, forwardLabel: yearLabel)
        setLabelsConstraints(label: yearTextLabel, previousLabel: yearLabel, forwardLabel: ratedLabel)
        setLabelsConstraints(label: ratedTextLabel, previousLabel: ratedLabel, forwardLabel: releasedLabel)
        setLabelsConstraints(label: releasedTextLabel, previousLabel: releasedLabel, forwardLabel: runTimeLabel)
        setLabelsConstraints(label: runTimeTextLabel, previousLabel: runTimeLabel, forwardLabel: genreLabel)
        setLabelsConstraints(label: genreTextLabel, previousLabel: genreLabel, forwardLabel: directorLabel)
        setLabelsConstraints(label: directorTextLabel, previousLabel: directorLabel, forwardLabel: writerLabel)
        setLabelsConstraints(label: writerTextLabel, previousLabel: writerLabel, forwardLabel: actorsLabel)
        setLabelsConstraints(label: actorsTextLabel, previousLabel: actorsLabel, forwardLabel: plotLabel)
        setLabelsConstraints(label: plotTextLabel, previousLabel: plotLabel, forwardLabel: languageLabel)
        setLabelsConstraints(label: languageTextLabel, previousLabel: languageLabel, forwardLabel: countryLabel)
        setLabelsConstraints(label: countryTextLabel, previousLabel: countryLabel, forwardLabel: awardsLabel)
        setLabelsConstraints(label: awardsTextLabel, previousLabel: awardsLabel, forwardLabel: metaScoreLabel)
        setLabelsConstraints(label: metaScoreTextLabel, previousLabel: metaScoreLabel, forwardLabel: imdbRatingsLabel)
        setLabelsConstraints(label: imdbRatingsTextLabel, previousLabel: imdbRatingsLabel, forwardLabel: imdbVotesLabel)
        setLabelsConstraints(label: imdbVotesTextLabel, previousLabel: imdbVotesLabel, forwardLabel: typeLabel)
        setLabelsConstraints(label: typeTextLabel, previousLabel: typeLabel, forwardLabel: dvdLabel)
        setLabelsConstraints(label: dvdTextLabel, previousLabel: dvdLabel, forwardLabel: boxOfficeLabel)
        setLabelsConstraints(label: boxOfficeTextLabel, previousLabel: boxOfficeLabel, forwardLabel: productionLabel)
        setLabelsConstraints(label: productionTextLabel, previousLabel: productionLabel, forwardLabel: websiteLabel)
        setBottomLabelConstraints(label: websiteTextLabel, previousLabel: websiteLabel)
        self.scrollView.contentSize = CGSize(width: view.width,
                                             height: websiteTextLabel.bottom + 50)
    }
    
    func setLabelsConstraints(label: UILabel, previousLabel: UILabel, forwardLabel: UILabel) {
        let rightLabelWidth = self.view.width - 120
        lazy var containerViewHeight: CGFloat = DynamicLabelSize.height(text: label.text,
                                                                        font: labelFont,
                                                                        width: rightLabelWidth)
        
        label.self.frame = CGRect(x: previousLabel.right + 10,
                                  y: previousLabel.top,
                                  width: scrollView.width - (previousLabel.right + 20),
                                  height: containerViewHeight)
        
        forwardLabel.self.frame = CGRect(x: 10,
                                         y: label.bottom + 10,
                                         width: 100,
                                         height: 19.5)
    }
    
    func setBottomLabelConstraints(label: UILabel, previousLabel: UILabel) {
        let rightLabelWidth = self.view.width - 120
        lazy var containerViewHeight: CGFloat = DynamicLabelSize.height(text: label.text,
                                                                        font: labelFont,
                                                                        width: rightLabelWidth)
        
        label.self.frame = CGRect(x: previousLabel.right + 10,
                                  y: previousLabel.top,
                                  width: scrollView.width - (previousLabel.right + 20),
                                  height: containerViewHeight)
        
    }
    
    func setTopLabelsConstraints(label: UILabel, forwardLabel: UILabel) {
        let rightLabelWidth = self.view.width - 120
        lazy var containerViewHeight: CGFloat = DynamicLabelSize.height(text: label.text,
                                                                        font: label.font,
                                                                        width: rightLabelWidth)

        label.self.frame = CGRect(x: 20,
                                  y: self.posterImage.bottom + 15,
                                  width: scrollView.width - 40,
                                  height: containerViewHeight)
        
        forwardLabel.self.frame = CGRect(x: 10,
                                         y: label.bottom + 10,
                                         width: 100,
                                         height: 19.5)

    }
    
}
