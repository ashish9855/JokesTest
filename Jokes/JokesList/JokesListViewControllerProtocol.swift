//
//  JokesListViewControllerProtocol.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation
import UIKit

protocol JokesListViewControllerInteractorInputProtocol: class {
    
    var presenter: JokesListViewControllerInteractorOutputProtocol? { get set }
    var network: Network? { get set }
    func retrieveJokes(url: String, count: Int)
}

protocol JokesListViewControllerInteractorOutputProtocol: class {
    
    // INTERACTOR -> PRESENTER
    func didRetrieve(jokes: [Joke])
    func onError(with message: APIError)
}

protocol JokesListViewControllerPresenterProtocol: class {
    
    var view: JokesListViewControllerProtocol? { get set }
    var wireFrame: JokesListViewControllerWireFrameProtocol? { get set }
    var interactor: JokesListViewControllerInteractorInputProtocol? { get set }
    var jokes:[Joke] {get set}
    
    // VIEW -> PRESENTER
    func didLoad()
    func reloadData(with firstName: String, and lastName: String)
}

protocol JokesListViewControllerWireFrameProtocol: class {
    static func createJokesListModule() -> UIViewController
}

protocol JokesListViewControllerProtocol: class {
    
    var presenter: JokesListViewControllerPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showError(with message: String)
    func showJokes()
}
