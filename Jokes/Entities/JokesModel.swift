//
//  JokesModel.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

struct JokesResponse: Codable {
    
    let type: String
    let jokes: [Joke]
    enum CodingKeys: String, CodingKey {
        case jokes = "values"
        case type = "type"
    }
}

struct Joke: Codable {
    
    let id: String
    let joke: String
}
