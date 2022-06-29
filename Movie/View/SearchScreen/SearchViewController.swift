//
//  ViewController.swift
//  Movie
//
//  Created by Mehmet  Kulakoğlu on 22.06.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    private let searchTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Search..."
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.masksToBounds = true
        field.layer.cornerRadius = 8.0
        field.textAlignment = .left
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.backgroundColor = .systemBackground
        return field
    }()
    
    private var pageNumberPicker = UIPickerView()
    private var pageNumberArray = ["1"]
    
    private let pageTextField: UITextField = {
        let field = UITextField()
        field.textAlignment = .center
        field.text = "1"
        field.textColor = .systemBlue
        return field
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private var searchTitle: String?
    private var pageNumber = "1"
    private var pageNumberInt: Int?
    private var searchResult: SearchResultViewModel?
    private var movieInfoList: [MovieInfoViewModel]?
    private var totalPage: String?
    
    private var isKeyBoard = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tabBarHeight = self.tabBarController?.tabBar.frame.height ?? 49.0
        searchButton.frame = CGRect(x: view.width - 85,
                                    y: tabBarHeight + 10,
                                    width: 80,
                                    height: 42)
        searchTextField.frame = CGRect(x: 5,
                                       y: searchButton.top,
                                       width: searchButton.left - 10,
                                       height: 42)
        pageTextField.frame = CGRect(x: (view.width / 2) - 25,
                                     y: view.height - 65,
                                     width: 50,
                                     height: 50)
        tableView.frame = CGRect(x: 5,
                                 y: searchTextField.bottom + 10,
                                 width: view.width - 10,
                                 height: pageTextField.top - searchTextField.bottom - 20)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        initializeHideKeyboard()
        
        pageNumberPicker.delegate = self
        pageNumberPicker.dataSource = self
        pageTextField.inputView = pageNumberPicker
        
        pageTextField.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self,
                           forCellReuseIdentifier: MovieTableViewCell.identifier)
      
        searchButton.addTarget(self,
                               action: #selector(firstPage),
                               for: .touchUpInside)
        
        pageSettings()
        
        addSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let selection = self.tableView.indexPathForSelectedRow else {
            return
        }
        tableView.deselectRow(at: selection, animated: true)
        tableView.reloadData()
    }
    
    @objc func goToMovie(_ sender: UITapGestureRecognizer) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let id = self.searchResult!.movieInfoList[indexPath.row].imdbID
            let vc = ShowDetailViewController(id: id)
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
    
    
    func addSubviews() {
        view.addSubview(searchTextField)
        view.addSubview(tableView)
        view.addSubview(searchButton)
        view.addSubview(pageTextField)
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        isKeyBoard = true
        
    }

    @objc func keyboardWillDisappear(_ notification: NSNotification) {
       isKeyBoard = false
    }
    
    @objc func getData() {
        
        guard searchTextField.text!.count > 2 else {
            self.makeAlert(title: "WARNING", message: "You should type 3 characters at least!")
            return
        }
        
        WebserviceMovieList().downloadMovieInfo(searchTitle: searchTextField.text!, page: self.pageNumber ) { result in
            
            switch result {
            case .failure(.parseError):
                DispatchQueue.main.async {
                self.makeAlert(title: "Sorry", message: "We can not find any movie's title contains \"\(self.searchTextField.text!)\"")
                    self.searchResult = nil
                    self.tableView.reloadData()
                }
                
            case .failure(_):
                
                DispatchQueue.main.async {
                    self.makeAlert(title: "Sorry", message: "We had connection problem. Please try again! ")
                    self.searchResult = nil
                    self.tableView.reloadData()
                }
                
            case .success(let searchResult):
                
                DispatchQueue.main.async {
                    
                    self.searchTitle = self.searchTextField.text
                    self.searchResult = SearchResultViewModel(movieList: searchResult)
                    self.totalPage = self.searchResult?.totalResults
                    self.tableView.reloadData()
                    self.pageSettings()
                    self.pageNumberPicker.reloadAllComponents()
                }
            }
        }
        
    }
    
    @objc func firstPage() {

        DispatchQueue.main.async {
            self.cleanPages()
            self.getData()
        }
  
    }

}

// MARK: Page Settings

extension SearchViewController {
    
    func pageSettings() {
        
        guard searchResult != nil && searchResult!.pageCount > 1 else {
            self.pageTextField.isHidden = true
            return
        }
        
        self.pageTextField.isHidden = false
        
        self.pageNumberArray.removeAll(keepingCapacity: false)
        for page in 1...self.searchResult!.pageCount {
            let pageString = String(page)
            self.pageNumberArray.append(pageString)
        }
    }
    
    func cleanPages() {
        self.pageNumberArray = ["1"]
        self.pageNumber = "1"
        self.pageNumberInt = 1
        self.pageTextField.text = "1"
    }
    
}

// MARK: Table View Settings

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.searchResult != nil else {
            return 0
        }
        return self.searchResult!.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard self.searchResult != nil else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configure(with: self.searchResult!.movieInfoAtIndex(indexPath.row).movieInfo)
        cell.isUserInteractionEnabled = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isKeyBoard {
            self.view.endEditing(true)
            return
        }
        tableView.deselectRow(at: indexPath, animated: false)
        let id = self.searchResult!.movieInfoList[indexPath.row].imdbID
        let vc = ShowDetailViewController(id: id)
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
}

// MARK: Page Picker View Settings

extension SearchViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pageNumberArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pageNumberArray[row]
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pageNumber = String(row + 1)
        self.pageTextField.text = self.pageNumber
        self.getData()
        pickerView.resignFirstResponder()
    }
    
}

// MARK: TextField Return Key

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.getData()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
