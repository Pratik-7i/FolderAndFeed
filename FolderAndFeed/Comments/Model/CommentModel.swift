//
//  CommentModel.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import Foundation

class Comment {
    var text: String = ""
    var time: Date?
    var replies: [Reply] = []
    
    init(text: String, time: Date? = nil, replies: [Reply]) {
        self.text = text
        self.time = time
        self.replies = replies
    }
}

class Reply {
    var text: String?
    var time: Date?
    
    init(text: String? = nil, time: Date? = nil) {
        self.text = text
        self.time = time
    }
}
