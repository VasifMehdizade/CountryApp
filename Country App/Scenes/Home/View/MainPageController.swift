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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftNavButton: UIButton!
    @IBOutlet weak var rightNavButton: UIButton!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var navStack: UIStackView!
    @IBOutlet weak var searchStack: UIStackView!
    @IBOutlet weak var cancelButton: UIButton!

    
    
    var listItems = [CountryElement]()
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
        setupView()
        setupTarget()
    }
    private func setupView() {
        tableView.registerCell(type: HomePageViewCell.self)
        myView.layer.borderColor = UIColor.lightGray.cgColor
        myView.layer.borderWidth = 0.5
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
    
    func getPosts() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {return}
        AF.request(url, method: .get).responseData { response in
            do {
                let posts = try JSONDecoder().decode(([CountryElement].self), from: response.data ?? Data())
                self.listItems = posts
                self.tableView.reloadData()
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
}

extension MainPageController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: HomePageViewCell.self,
                                               for: indexPath) as? HomePageViewCell else {
                  return UITableViewCell()
        }
        cell.countryName.text = listItems[indexPath.row].name?.official
        cell.countryImage.sd_setImage(with: URL(string: listItems[indexPath.row].flags?.png ?? ""))
//        cell.countryName.text = viewModel.searchResults[indexPath.row].name?.common
//        cell.countryImage.sd_setImage(with: URL(string: viewModel.searchResults[indexPath.row].flags?.png ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//extension MainPageController : UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        viewModel.searchResults(text: searchTextField.text ?? "")
//        textField.resignFirstResponder()
//        return true
//    }
//}
