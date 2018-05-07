//
//  JokeTableViewCell.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {

    @IBOutlet weak var jokeLabel: UILabel!
    
    func set(joke:Joke?) {
        jokeLabel.text = joke.title
    }
}
