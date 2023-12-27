//
//  CommentsViewModel.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import Foundation

protocol CommentsDelegate: AnyObject {
    func didAddComment()
    func didAddReply(forCommentAtIndex index: Int)
}

class CommentsViewModel {
    weak var commentsDelegate: CommentsDelegate?
    var comments: [Comment] = []
}

extension CommentsViewModel {
    
    func addComment(_ text: String?) {
        if let text = text, text.count > 0 {
            let comment = Comment(text: text, time: Date(), replies: [])
            comments.append(comment)
            self.commentsDelegate?.didAddComment()
        }
    }
    
    func addReply(_ text: String?,
                  forCommentAtIndex index: Int) {
        if let text = text, text.count > 0 {
            let comment = comments[index]
            let reply = Reply(text: text, time: Date())
            comment.replies.append(reply)
            self.commentsDelegate?.didAddReply(forCommentAtIndex: index)
        }
    }
}
