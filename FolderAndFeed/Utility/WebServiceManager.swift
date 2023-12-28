//
//  WebServiceManager.swift
//  FolderAndFeed
//
//  Created by Pratik on 25/12/23.
//

import UIKit

enum FetchError: Error {
    case invalidURL
    case noResponse
    case noData
}

extension FetchError {
    
    var errorDescription: String? {
        switch self
        {
        case .invalidURL:
            return "Invalid URL"
        case .noResponse:
            return "No response found from the server"
        case .noData:
            return "No data found from the server"
        }
    }
}

class WebServiceManager {
    
    static let shared = WebServiceManager()
    typealias WebServiceCompletionBlock = (_ data: Data?, _ error: Error?) -> Void
    
    func request(_ url: API, completion: @escaping WebServiceCompletionBlock) {
        
        guard let url = URL(string: url.rawValue) else {
            completion(nil, FetchError.invalidURL)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                    return
                }
                guard response != nil else {
                    completion(nil, FetchError.noResponse)
                    return
                }
                guard let data = data else {
                    completion(nil, FetchError.noData)
                    return
                }
                completion(data, nil)
            }
        }
        task.resume()
    }
}
