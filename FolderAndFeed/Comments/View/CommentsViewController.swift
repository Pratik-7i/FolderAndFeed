//
//  CommentsViewController.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var commentsTable: UITableView!

    lazy var viewModel = {
        let viewModel = CommentsViewModel()
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        commentsTable.registerNib(cellClass: CommentCell.self)
        commentsTable.registerNib(cellClass: ReplyCell.self)
    }
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        showInputDialog(title: "Comment", actionHandler: { (text: String?) in
            if let text = text, text.count > 0 {
                let comment = Comment(text: text, time: Date(), replies: [])
                self.viewModel.comments.append(comment)
                DispatchQueue.main.async {
                    self.commentsTable.reloadData()
                }
            }
        })
    }
    
    func addReply(forComment index: Int) {
        showInputDialog(title: "Reply", actionHandler: { (text: String?) in
            if let text = text, text.count > 0 {
                let comment = self.viewModel.comments[index]
                let reply = Reply(text: text, time: Date())
                comment.replies.append(reply)
                DispatchQueue.main.async {
                    self.commentsTable.reloadSections([index], with: .automatic)
                }
            }
        })
    }
}

extension CommentsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.comments.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let comment = viewModel.comments[section]
        print("")
        print("Roes: \(comment.replies.count + 1)")
        return comment.replies.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = viewModel.comments[indexPath.section]
        // Comment
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(cellClass: CommentCell.self, for: indexPath)
            cell.load(comment, index: indexPath.section)
            cell.replyButtonTapped = { [weak self] sender in
                guard let self = self else { return }
                self.addReply(forComment: indexPath.section)
            }
            return cell
        }
        // Replies
        else {
            let cell = tableView.dequeueReusableCell(cellClass: ReplyCell.self, for: indexPath)
            let reply = comment.replies[indexPath.row-1]
            cell.load(reply, index: indexPath.row-1)
            return cell
        }
    }
}
