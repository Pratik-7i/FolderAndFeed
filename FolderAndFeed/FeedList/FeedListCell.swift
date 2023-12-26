//
//  FeedListCell.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import UIKit

class FeedListCell: UITableViewCell, NibProvidable, ReusableView {
    
    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var feedTimeLabel: UILabel!
    @IBOutlet weak var feedTitleLabel: UILabel!
    @IBOutlet weak var feedDescLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        selectionStyle = .none
        feedView.layer.cornerRadius = 8
        feedImageView.layer.cornerRadius = 6
        authorImageView.layer.cornerRadius = 18
    }
    
    func load(_ feed: FeedModel, index: Int) {
        let avatarUrl = "https://i.pravatar.cc/108?/img=\(index)"
        authorImageView.setImage(url: avatarUrl)
        authorNameLabel.text = feed.author
        feedTitleLabel.text = feed.title
        feedDescLabel.text = feed.description
        feedImageView.setImage(url: feed.urlToImage)
        // Date
        if let date = feed.publishedAt?.toDate(withFormat: "yyyy-MM-dd'T'HH:mm:ssZ") {
            feedTimeLabel.text = date.timeAgo()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
