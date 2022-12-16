//
//  MainPageController.swift
//  Country App
//
//  Created by Vasif Mehdi on 16.12.22.
//

import UIKit
import Alamofire

class MainPageController: UIViewController {
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UIView!
    @IBOutlet weak var rightNavButton: UIView!
    @IBOutlet weak var navLabel: UIView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var leftNavButton: UIView!
    
    var listItems = [CountryElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
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

extension MainPageController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageViewCell", for: indexPath) as! HomePageViewCell
        cell.countryName.text = listItems[indexPath.row].name?.official
        cell.countryImage.sd_setImage(with: URL(string: listItems[indexPath.row].flags?.png ?? ""))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
