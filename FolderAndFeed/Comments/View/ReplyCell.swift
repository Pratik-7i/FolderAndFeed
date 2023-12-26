//
//  ReplyCell.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import UIKit

class ReplyCell: UITableViewCell, NibProvidable, ReusableView {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var replyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        userImageView.layer.cornerRadius = 13
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func load(_ reply: Reply, index: Int) {
        let avatarUrl = "https://i.pravatar.cc/108?/img=\(index)"
        userImageView.setImage(url: avatarUrl)
        replyLabel.text = reply.text
    }
}
