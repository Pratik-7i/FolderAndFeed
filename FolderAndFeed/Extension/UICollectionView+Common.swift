//
//  UICollectionView+Common.swift
//  FolderAndFeed
//
//  Created by Pratik on 01/12/22.
//

import UIKit

extension UICollectionView {
    
    func registerClass<T: UITableViewCell>(cellClass: T.Type) where T: ReusableView {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    func registerNib<T: UICollectionViewCell>(cellClass: T.Type) where T: NibProvidable & ReusableView {
        register(cellClass.nib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(cellClass.reuseIdentifier) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
