//
//  JokesListViewControllerPresenter.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

class JokesListViewControllerPresenter: JokesListViewControllerPresenterProtocol {
  
    weak var view: JokesListViewControllerProtocol?
    var wireFrame: JokesListViewControllerWireFrameProtocol?
    var interactor: JokesListViewControllerInteractorInputProtocol?
    var jokes: [Joke] = []
    private var firstName = "Chuck"
    private var lastName = "Norris"

    func didLoad() {
        interactor?.retrieveJokes(url: Endpoints.randomJokes.fetch.url, count: 10)
    }
    
    func reloadData(with firstName: String, and lastName: String) {
        replaceJokes(with: firstName, and: lastName)
        self.firstName = firstName
        self.lastName = lastName
        view?.showJokes()
    }
    
    private func replaceJokes(with firstName: String, and lastName: String) {
        
        jokes = jokes.map { (joke) -> Joke in
            var newJoke = joke
            newJoke.title = joke.title.replacingOccurrences(of: self.firstName, with: firstName)
            newJoke.title = newJoke.title.replacingOccurrences(of: self.lastName, with: lastName)
            return newJoke
        }
    }
}

extension JokesListViewControllerPresenter:JokesListViewControllerInteractorOutputProtocol {
    
    func didRetrieve(jokes: [Joke]) {
        self.jokes = jokes
    }
    
    func onError(with message: APIError) {
        view?.showError(with: message.description)
    }
}
