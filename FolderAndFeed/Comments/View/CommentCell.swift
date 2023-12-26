//
//  CommentCell.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import UIKit

class CommentCell: UITableViewCell, NibProvidable, ReusableView {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    var replyButtonTapped: ((UIButton)->())? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        userImageView.layer.cornerRadius = 13
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func load(_ comment: Comment, index: Int) {
        let avatarUrl = "https://i.pravatar.cc/108?/img=\(index)"
        userImageView.setImage(url: avatarUrl)
        commentLabel.text = comment.text
    }
}

extension CommentCell {
    @IBAction func replyButtonTapped(_ sender: UIButton) {
        self.replyButtonTapped?(sender)
    }
}
