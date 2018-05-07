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
        let newUrl = url + String(count)
        guard let url = URL(string: newUrl) else {
            return
        }
        network?.makeRequest(with: url, method: .GET, parameters: nil)
    }
}


extension JokesListViewControllerInteractor: NetworkProtocols {
    
    func onSuccess(_ data: AnyObject) {
       
        let jsonData =  try? JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonDecoder = JSONDecoder()
        guard let json = jsonData else {
            let error = APIError.ServerError(message: "Some error occured")
            self.presenter?.onError(with: error)
            return
        }
        if let response = try? jsonDecoder.decode(JokesResponse.self,
                                                 from: json) {
            self.presenter?.didRetrieve(jokes: response.jokes)
        }
        else {
            let error = APIError.ServerError(message: "Some error occured")
            self.presenter?.onError(with: error)
        }
    }
    
    func onError(_ error: APIError) {
        self.presenter?.onError(with: error)
    }
}
