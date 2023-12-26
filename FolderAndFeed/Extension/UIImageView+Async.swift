//
//  UIImageView+Async.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    public func setImage(url: String?,
                         placeholder: UIImage? = nil,
                         animated: Bool = true) {
        self.kf.setImage(with: URL.init(string: url ?? ""),
                         placeholder: placeholder,
                         options: animated ? [.transition(.fade(1))] : nil)
    }
}
