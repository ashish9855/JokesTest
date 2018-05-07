//
//  APIError.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

enum APIError {
    case NoInternet
    case HTTPError(statusCode: Int, message: String)
    case ServerError(message: String)
    
    var description: String {
        switch self {
        case .NoInternet:
            return "There is no internet connection."
        case .HTTPError( _, let message):
            return message
        case .ServerError(let message):
            return message
        }
    }
}
