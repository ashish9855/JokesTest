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

