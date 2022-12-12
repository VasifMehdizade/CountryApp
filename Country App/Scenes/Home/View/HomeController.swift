//
//  HomeController.swift
//  Country App
//
//  Created by Vasif Mehdi on 21.11.22.
//

import UIKit
import Alamofire
import SDWebImage

class HomeController: UIViewController {
    
    var listItems = [CountryElement]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftNavButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var navView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var rightNavButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        registerCell()
        getPosts()
    }
    
    @IBAction func leftNavButtonTapped(_ sender: Any) {
    }
    
    @IBAction func rightNavButtonTapped(_ sender: Any) {
    }
    
    func registerCell() {
        tableView.register(UINib(nibName: "HomePageViewCell", bundle: nil), forCellReuseIdentifier: "HomePageViewCell")
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

extension HomeController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageViewCell", for: indexPath) as! HomePageViewCell
        cell.countryName.text = listItems[indexPath.row].name?.official
        cell.countryImage.sd_setImage(with: URL(string: listItems[indexPath.row].flags?.png ?? ""))
        return cell
    }
    
}
