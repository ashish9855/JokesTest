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
    
    func didLoad() {
        interactor?.retrieveJokes(url: Endpoints.randomJokes.fetch.url, count: 10)
    }
    
    func reloadData(with firstName: String, and lastName: String) {
        replaceJokes(with: firstName, and: lastName)
        view?.showJokes()
    }
    
    private func replaceJokes(with firstName: String, and lastName: String) {
        
        jokes = jokes.map { (joke) -> Joke in
            var newJoke = joke
            newJoke.title = joke.title.replacingOccurrences(of: "Chuck", with: firstName)
            newJoke.title = joke.title.replacingOccurrences(of: "Norris", with: lastName)
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
