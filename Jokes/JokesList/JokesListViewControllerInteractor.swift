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
    
    func retrieveJokes(url: String, count: Int) {
        let newUrl = url + "/" + String(count)
        guard let url = URL(string: newUrl) else {
            return
        }
        network?.makeRequest(with: url, method: .GET, parameters: nil)
    }
}


extension JokesListViewControllerInteractor: NetworkProtocols {
    
    func onSuccess(_ data: AnyObject) {
        
    }
    
    func onError(_ error: APIError) {
        
    }
}
