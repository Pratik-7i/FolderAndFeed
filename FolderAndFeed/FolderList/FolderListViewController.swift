//
//  FolderListViewController.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import UIKit

class FolderListViewController: UIViewController {

    lazy var viewModel = {
        let viewModel = FolderListViewModel()
        return viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
