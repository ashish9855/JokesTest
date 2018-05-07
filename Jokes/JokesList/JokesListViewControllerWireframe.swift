//
//  JokesListViewControllerWireframe.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import Foundation
import UIKit

class JokesListViewControllerWireframe: JokesListViewControllerWireFrameProtocol {
   
    static func createJokesListModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "JokesListViewController")
        if let view = viewController as? JokesListViewController {
            
            let presenter: JokesListViewControllerPresenterProtocol & JokesListViewControllerInteractorOutputProtocol = JokesListViewControllerPresenter()
            let interactor: JokesListViewControllerInteractorInputProtocol & NetworkProtocols  = JokesListViewControllerInteractor()
            let wireFrame: JokesListViewControllerWireFrameProtocol = JokesListViewControllerWireframe()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.network = Network.init(interactor)
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
