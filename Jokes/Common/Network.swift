//
//  Network.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

protocol NetworkProtocols: class {
    func onSuccess(_ data: AnyObject)
    func onError(_ error: APIError)
}

enum HTTPMethod {
    case GET,POST,PUT
}

class Network {
    
    weak var delegate:NetworkProtocols?
    
    init(_ delegate: NetworkProtocols?) {
        self.delegate = delegate
    }
    
    func makeRequest(with url: URL, method: HTTPMethod, parameters: [AnyHashable : Any]?) {
        
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {[weak self] (data, response, error) in
            
            if (error != nil) {
                let apiError = APIError.ServerError(message: (error?.localizedDescription)!)
                self?.delegate?.onError(apiError)
                return
            }
            else {
                if let data = data {
                    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                        let apiError = APIError.ServerError(message: "Some error occured")
                        self?.delegate?.onError(apiError)
                        return
                    }
                    self?.delegate?.onSuccess(json as AnyObject)
                }
            }
        }
        task.resume()
    }
}
