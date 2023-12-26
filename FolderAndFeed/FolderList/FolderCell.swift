//
//  FolderCell.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import UIKit

class FolderCell: UICollectionViewCell, NibProvidable, ReusableView {
    
    @IBOutlet weak var folderNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func load(_ folder: String) {
        folderNameLabel.text = folder
    }
}
