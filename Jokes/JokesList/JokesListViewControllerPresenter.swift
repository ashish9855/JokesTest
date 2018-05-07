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
        interactor?.retrieveJokes(with: Endpoints.randomJokes.fetch.url, count: 10)
    }
}

extension JokesListViewControllerPresenter:JokesListViewControllerInteractorOutputProtocol {
    
    func didRetrieve(jokes: [Joke]) {
        
    }
    
    func onError(with: APIError) {
        
    }
}
