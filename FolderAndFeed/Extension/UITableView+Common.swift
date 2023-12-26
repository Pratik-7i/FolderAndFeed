//
//  UITableView+Common.swift
//  FolderAndFeed
//
//  Created by Pratik on 02/12/22.
//

import UIKit

// Protocol

protocol NibProvidable {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibProvidable {
    static var nibName: String {
        return "\(self)"
    }
    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
}

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return "\(self)"
    }
}

// Cell

extension UITableView {
    
    func registerClass<T: UITableViewCell>(cellClass: T.Type) where T: ReusableView {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func registerNib<T: UITableViewCell>(cellClass: T.Type) where T: NibProvidable & ReusableView {
        register(cellClass.nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(cellClass : T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error: cell with identifier: \(cellClass.reuseIdentifier) for index path: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
