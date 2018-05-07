//
//  JokesListViewControllerInteractor.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation

class JokesListViewControllerInteractor: JokesListViewControllerInteractorInputProtocol {
    
    weak var presenter: JokesListViewControllerInteractorOutputProtocol?
    var network: Network?
    
    func retrieveJokes() {
        
    }
}


extension JokesListViewControllerInteractor: NetworkProtocols {
    
    func onSuccess(_ data: AnyObject) {
        
    }
    
    func onError(_ error: APIError) {
        
    }
}
