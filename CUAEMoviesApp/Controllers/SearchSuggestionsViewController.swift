//
//  SearchSuggestionsViewController.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/22/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class SearchSuggestionsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var suggestionsList: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup
    fileprivate func setupViews() {
        tableView.registerCellNib(SuggestionCell.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = self.view.bounds.width
    }

}

extension SearchSuggestionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SuggestionCell.self)) as! SuggestionCell
        cell.setupCellWithSuggestion(name: suggestionsList[indexPath.row],
                                     numOfResults: 23)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let moviesListViewController = parent as? MoviesListViewController {
            moviesListViewController.selectedSuggestion = suggestionsList[indexPath.row]
        }
    }
}
