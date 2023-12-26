//
//  String+Extension.swift
//  FolderAndFeed
//
//  Created by Pratik on 26/12/23.
//

import Foundation

extension String {
    func toDate(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
