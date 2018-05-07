//
//  Endpoints.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://api.icndb.com"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum randomJokes: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/jokes/random/"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
