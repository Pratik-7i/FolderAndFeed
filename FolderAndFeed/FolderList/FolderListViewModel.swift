//
//  FolderListViewModel.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import Foundation

protocol FolderListDelegate: AnyObject {
    func didCompleteFolderCreation()
}

class FolderListViewModel
{
    weak var listDelegate: FolderListDelegate?
    var parentPath: String = FileManager.documentDirectoryPath
    var parentsArray: [String] = []
    
    /**
     After creation, we will fetch folders from document
     directory and show in collection view from this list only
    */
    var fetchedFolders: [String] = []
}

extension FolderListViewModel {
    
    func getFolderPath(forIndex i: Int) -> String {
        var folderName = ""
        if parentsArray.count > 0 {
            let parentFolderName = parentsArray.joined(separator: ".")
            folderName = "\(parentFolderName).\(i+1)"
        } else {
            folderName = "\(i+1)"
        }
        return parentPath + "/\(folderName)"
    }
    
    func createFolders() {
        for i in 0..<Constant.NoOfFolders {
            let folderPath = getFolderPath(forIndex: i)
            let error = FileManager.createFolder(at: folderPath)
            if error != nil {
                print("Error while creating folder")
            } else {
                print("Folder path: \(folderPath)")
            }
        }
        /**
         Now, we will fetch folders from document directory to crosscheck
         and load in collection view from that only
        */
        fetchFolders()
    }
    
    func fetchFolders() {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: parentPath)
            fetchedFolders = files.sorted()
            // Notify the list View
            if let delegate = self.listDelegate {
                delegate.didCompleteFolderCreation()
            }
        } catch let error {
            print("Could not get contents of directory: \(error.localizedDescription)")
        }
    }
}
