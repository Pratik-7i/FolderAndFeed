//
//  FolderListViewController.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import UIKit

class FolderListViewController: UIViewController {

    @IBOutlet weak var folderListCV: UICollectionView!
    @IBOutlet weak var activity: UIActivityIndicatorView!

    lazy var viewModel = {
        let viewModel = FolderListViewModel()
        viewModel.listDelegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        activity.startAnimating()
        viewModel.createFolders()
    }
    
    func configureUI() {
        folderListCV.registerNib(cellClass: FolderCell.self)
        folderListCV.collectionViewLayout = Constant.folderListCompositionalLayout
    }
}


extension FolderListViewController: FolderListDelegate {
    func didCompleteFolderCreation() {
        self.activity.stopAnimating()
        self.folderListCV.reloadData()
    }
}

extension FolderListViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.fetchedFolders.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(cellClass: FolderCell.self, for: indexPath)
        let folder = viewModel.fetchedFolders[indexPath.row]
        cell.load(folder)
        return cell
    }
}

extension FolderListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelectFolder(index: indexPath.item)
    }
}

extension FolderListViewController {
    func didSelectFolder(index i: Int) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FolderListViewController") as! FolderListViewController
        let folder = viewModel.fetchedFolders[i]
        vc.title = folder
        // Setup ViewModel
        vc.viewModel.parentsArray = self.viewModel.parentsArray
        vc.viewModel.parentsArray.append("\(i+1)")
        let path = viewModel.getFolderPath(forIndex: i)
        vc.viewModel.parentPath = path
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

