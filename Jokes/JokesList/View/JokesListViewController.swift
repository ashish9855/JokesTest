//
//  JokesListViewController.swift
//  Jokes
//
//  Created by Ashish Maheshwari on 06/05/18.
//  Copyright © 2018 Ashish Maheshwari. All rights reserved.
//

import UIKit

class JokesListViewController: UIViewController {

    let cellIndetifier = "JokeTableViewCell"
    var presenter: JokesListViewControllerPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        guard let firstName = self.firstNameField.text else {
            showAlert(with: "PLease enter first name")
            return
        }
        guard let lastName = self.lastNameField.text else {
            showAlert(with: "PLease enter last name")
            return
        }
        presenter?.reloadData(with: firstName, and: lastName)
    }
}

extension JokesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let rows = presenter?.jokes.count {
            return rows
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath) as! JokeTableViewCell
        let joke = presenter?.jokes[indexPath.item]
        cell.set(joke: joke)
        return cell
    }
}

extension JokesListViewController: JokesListViewControllerProtocol {
    
    func showError(with message: String) {
        showAlert(with: message)
    }
    
    func showJokes() {
        tableView.reloadData()
    }
}

extension JokesListViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
