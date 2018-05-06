//
//  Network.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

protocol NetworkProtocols: class {
    func onSuccess(_ data: [Joke])
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
}
