//
//  MoviesListViewController.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/14/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit


/**
 *  Bill Details view controller Protocols
 */
protocol MoviesListViewProtocol: class {
    
    func refreshView()
    func showErrorWithMessage(_ errorMsg: String)
}


class MoviesListViewController: UIViewController {

    // MARK: - Private Varaibles
    
    /**
     *  The movies list presenter,
     */
    private lazy var moviesListPresenter: MoviesListPresenter = MoviesListPresenter(self)
    
    
    /**
     *  The details table, showing mode
     */
    var showingMode: TableShowMode = .loading {
        didSet {
            contentTableView.reloadData()
            updateResultsLabel()
        }
    }
    var selectedSuggestion: String! {
        didSet {
            moviesSearchBar.text = selectedSuggestion
            searchBarSearchButtonClicked(moviesSearchBar)
        }
    }
    
    
    @IBOutlet private weak var contentTableView: UITableView!
    @IBOutlet private weak var moviesSearchBar: UISearchBar! 
    @IBOutlet private weak var tableHeaderView: UIView!
    @IBOutlet private weak var resultsLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    
    private func setupViews() {
        setupSuggestionsList(forBeginSearch: false)
        contentTableView.registerCellNib(MovieCell.self)
        contentTableView.registerCellNib(ErrorCell.self)
        contentTableView.rowHeight = UITableViewAutomaticDimension
        contentTableView.estimatedRowHeight = self.view.bounds.width
    }
    
    private func updateResultsLabel() {
        let totalResults = moviesListPresenter.searchResult?.totalResults
        resultsLabel.text = "Found \(totalResults ?? 0) results by '\(moviesSearchBar.text ?? "")'"
    }
    
    private func setupSuggestionsList(forBeginSearch: Bool) {
        if !forBeginSearch { self.view.endEditing(true) }
        self.containerView.isHidden = false

        if let suggestionsViewController = childViewControllers.first as? SearchSuggestionsViewController, forBeginSearch {
            suggestionsViewController.suggestionsList = moviesListPresenter.getSuggestionsList()
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.containerView.alpha = forBeginSearch ? 1 : 0
        }) { (_) in
            self.containerView.isHidden = !forBeginSearch
        }
    }
}

extension MoviesListViewController: MoviesListViewProtocol {
    
    func refreshView() {
        showingMode = moviesListPresenter.moviesList.count > 0 ? .normal : .error(msg: MoviesListConstants.noDataPlaceholder)
        debugPrint("💃💃💃")
    }
    
    func showErrorWithMessage(_ errorMsg: String) {
        showingMode = .error(msg: errorMsg)
        debugPrint("🤷‍♀️🤷‍♀️🤷‍♀️")
    }
    
}




// MARK: - UISearchBarDelegate
extension MoviesListViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if moviesListPresenter.getSuggestionsList().count > 0 {
            setupSuggestionsList(forBeginSearch: true)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        setupSuggestionsList(forBeginSearch: false)
        showingMode = .loading
        moviesListPresenter.getMoviesList(searchBar.text ?? "", pageNum: 1)
    }
}


extension MoviesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch showingMode {
        case .normal:
            return moviesListPresenter.moviesList.count
        case .error:
            return 1
        case .loading:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch showingMode {
        case .error(let msg):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ErrorCell.self)) as! ErrorCell
            cell.setupWithMsg(msg)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MovieCell.self)) as! MovieCell
            cell.setupWithModel(moviesListPresenter.moviesList[indexPath.row])
            return cell
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        moviesListPresenter.getMoviesList(moviesSearchBar.text ?? "", pageNum: moviesListPresenter.getCurrentPageNumber()+1)
    }
}


