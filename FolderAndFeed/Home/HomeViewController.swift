//
//  HomeViewController.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var folderButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        folderButton.layer.cornerRadius = 5
        feedButton.layer.cornerRadius = 5
    }
}
