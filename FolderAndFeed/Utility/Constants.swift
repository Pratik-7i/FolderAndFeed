//
//  Constants.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import Foundation
import UIKit

let APIManager = WebServiceManager.shared

enum API: String {
    case getFeeds = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=17cf1b333e964cea91e89e1e824bd366"
}

enum Layout {
    static let aspectRatio = 1.3
}

enum ItemsPerRow: Int {
    case iPhone = 3
    case iPad   = 5
}

enum Constant {
    static let NoOfFolders = 8
    
    static let folderListCompositionalLayout = UICollectionViewCompositionalLayout(
        sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
        let isPhone = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone
        let items = isPhone ? ItemsPerRow.iPhone.rawValue : ItemsPerRow.iPad.rawValue
        let fraction = 1 / CGFloat(items) * CGFloat(Layout.aspectRatio)
        let inset: CGFloat = 4
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: items)
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        return section
    })
}
