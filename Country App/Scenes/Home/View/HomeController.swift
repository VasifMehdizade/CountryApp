//
//  HomeController.swift
//  Country App
//
//  Created by Vasif Mehdi on 21.11.22.
//

import UIKit

class HomeController: UIViewController {
    
    var viewModel = HomeViewModel()

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    registerCell()
        configurationViewModel()
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "HomePageViewCell", bundle: nil), forCellReuseIdentifier: "HomePageViewCell")
    }
    
    func configurationViewModel() {
        viewModel.errorCallback = { message in
            self.dismissLoader()
            self.showAlert(message: message) {}
        }
        
        viewModel.successCallback = {
            self.dismissLoader()
            self.tableView.reloadData()
        }
    }

}

extension HomeController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countryResults?.name.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel
    }
      
}

extension HomeController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        viewModel.getCountryResults(text: textField.text ?? "")
        textField.resignFirstResponder()
        return true
    }
}
