//
//  FileManager+Extension.swift .swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import Foundation

extension FileManager {
    
    static let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                           .userDomainMask, true).first ?? ""

    static func createFolder(at path: String) -> Error? {
        if FileManager.default.fileExists(atPath: path) {
            print("Folder already exists!")
        } else {
            do {
                try FileManager.default.createDirectory(atPath: path,
                                                        withIntermediateDirectories: true,
                                                        attributes: nil)
            } catch let error {
                print("error: \(error)")
                return error
            }
        }
        return nil
    }
}
