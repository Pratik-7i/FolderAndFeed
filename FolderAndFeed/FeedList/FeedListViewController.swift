//
//  FeedListViewController.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import UIKit

class FeedListViewController: UIViewController {

    @IBOutlet weak var feedListTable: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var errorView : UIView!
    @IBOutlet weak var errorLabel : UILabel!
    
    lazy var viewModel = {
        let viewModel = FeedListViewModel()
        viewModel.listDelegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.fetchFeeds()
    }
    
    func fetchFeeds() {
        activity.startAnimating()
        viewModel.fetchFeeds()
    }
    
    func configureUI() {
        feedListTable.registerNib(cellClass: FeedListCell.self)
    }
    
    @IBAction func retryButtonTapped(_ sender: UIButton) {
        self.fetchFeeds()
    }
    
    func updateUI(isError: Bool, errorMessage: String? = "") {
        activity.stopAnimating()
        self.feedListTable.isHidden = isError
        self.errorView.isHidden = !isError
        self.errorLabel.text = errorMessage
    }
}

extension FeedListViewController: FeedListDelegate {

    func feedsDidFetch() {
        self.updateUI(isError: false)
        self.feedListTable.reloadData()
    }
    func feedsFetchFailed(error: String?) {
        self.updateUI(isError: true, errorMessage: error)
    }
}

extension FeedListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.feeds?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: FeedListCell.self, for: indexPath)
        if let feed = viewModel.feeds?[indexPath.row] {
            cell.load(feed, index: indexPath.row)
        }
        return cell
    }
}

extension FeedListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
