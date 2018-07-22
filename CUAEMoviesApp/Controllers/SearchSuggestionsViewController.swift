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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Setup
    fileprivate func setupViews() {
        tableView.registerCellNib(SuggestionCell.self)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = self.view.bounds.width
        tableView.accessibilityIdentifier = "SuggestionsTableView"
    }

    func setupSuggestionView() {
        
    }

}

extension SearchSuggestionsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return SearchManager().getLastSuccessfulSearchQueries().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SuggestionCell.self)) as! SuggestionCell
        cell.setupCellWithSuggestion(name: SearchManager().getLastSuccessfulSearchQueries()[indexPath.row],
                                     numOfResults: 23)
        return cell
    }
}
