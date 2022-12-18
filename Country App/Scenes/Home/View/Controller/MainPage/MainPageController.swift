//
//  MainPageController.swift
//  Country App
//
//  Created by Vasif Mehdi on 16.12.22.
//

import UIKit
import Alamofire
import SDWebImage

class MainPageController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var leftNavButton: UIButton!
    @IBOutlet private weak var rightNavButton: UIButton!
    @IBOutlet private weak var navLabel: UILabel!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var navView: UIView!
    @IBOutlet private weak var navStack: UIStackView!
    @IBOutlet private weak var searchStack: UIStackView!
    @IBOutlet private weak var cancelButton: UIButton!
    
    var listItems = [CountryElement]()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationViewModel()
        setupView()
        setupTarget()
    }
    
    private func configurationViewModel() {
        showLoader()
        viewModel.getCountryResults()
        viewModel.errorCallback = { message in
            self.dismissLoader()
            self.showAlert(message: message) {}
        }
        
        viewModel.successCallback = {
            self.dismissLoader()
            self.tableView.reloadData()
        }
    }
    
    private func setupView() {
        tableView.registerCell(type: HomePageViewCell.self)
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 1.5
    }
    
    private func setupTarget() {
        cancelButton.addTarget(self,
                               action: #selector(cancelButtonClicked),
                               for: .touchUpInside)
    }
    
    @objc func cancelButtonClicked() {
        UIView.animate(withDuration: 0.2) {
            self.searchStack.isHidden = true
            self.navStack.isHidden = false
            self.view.layoutIfNeeded()
        }
        viewModel.getCountryResults()
    }
    
    @IBAction func leftNavButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func rightNavButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.searchStack.isHidden = false
            self.navStack.isHidden = true
            self.view.layoutIfNeeded()
        }
    }
    
//    func getPosts() {
//        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {return}
//        AF.request(url, method: .get).responseData { response in
//            do {
//                let posts = try JSONDecoder().decode(([CountryElement].self), from: response.data ?? Data())
//                self.listItems = posts
//                self.listItems = self.listItems.sorted(by: { $0.population ?? 0 > $1.population ?? 0})
//                self.tableView.reloadData()
//            }
//            catch {
//                print("error: \(error.localizedDescription)")
//            }
//        }
//    }
    
    func searchFilter() {
        for common in viewModel.countryResults  {
            if (common.name?.common == searchTextField.text) {
                viewModel.countryResults.removeAll()
                viewModel.countryResults.append(common)
                tableView.reloadData()
            }
        }
    }
    
//    func findFiltering() {
//        var filterVariable = listItems.filter({$0.name?.common == searchTextField.text ?? ""})
//        print(filterVariable)
//    }
    
}

extension MainPageController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countryResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: HomePageViewCell.self,
                                               for: indexPath) as? HomePageViewCell else {
            return UITableViewCell()
        }
        cell.countryName.text = "\(indexPath.row + 1 ) \(viewModel.countryResults[indexPath.row].name?.common ?? "")"
        cell.countryImage.sd_setImage(with: URL(string: viewModel.countryResults[indexPath.row].flags?.png ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = mainStoryBoard.instantiateViewController(withIdentifier: "DetailController") as! DetailController
        nextViewController.countryName.text = viewModel.countryResults[indexPath.row].name?.common
         self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension MainPageController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchFilter()
        textField.resignFirstResponder()
        return true
    }
}
