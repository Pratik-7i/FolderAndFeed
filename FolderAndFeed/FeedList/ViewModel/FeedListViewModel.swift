//
//  FeedListViewModel.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import Foundation

protocol FeedListDelegate: AnyObject {
    func feedsDidFetch()
    func feedsFetchFailed(error: String?)
}

class FeedListViewModel {
    
    weak var listDelegate: FeedListDelegate?
    var feeds: [Feed]?

    func fetchFeeds() {
        APIManager.request(.getFeeds) { data, error in
            if let fetchError = error {
                self.listDelegate?.feedsFetchFailed(error: fetchError.localizedDescription)
                return
            }
            do {
                let newsResponse = try JSONDecoder().decode(ResponseModel.self, from: data!)
                guard let articles = newsResponse.articles else {
                    self.listDelegate?.feedsFetchFailed(error: "No feed found from the server")
                    return
                }
                self.feeds = articles
                self.listDelegate?.feedsDidFetch()
            } catch let error {
                self.listDelegate?.feedsFetchFailed(error: error.localizedDescription)
            }
        }
    }
}
