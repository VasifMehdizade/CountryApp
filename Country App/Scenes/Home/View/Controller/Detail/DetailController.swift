//
//  DetailController.swift
//  Country App
//
//  Created by Vasif Mehdi on 18.12.22.
//

import UIKit
import Alamofire
import SDWebImage


class DetailController: UIViewController {
    
    var countryCommonName = ""
    
    var listItems = [CountryElement]()
    
    //    var variable = listItems
    
    //    var viewModel = DetailViewModel()
    
    @IBOutlet weak var flagImage: UILabel!
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var colorfulView: UIView!
    @IBOutlet weak var regionResponse: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var areaResponse: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var populationResponse: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyResponse: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var capitalResponse: UILabel!
    @IBOutlet weak var timezoneLabel: UILabel!
    @IBOutlet weak var timezoneResponse: UILabel!
    @IBOutlet weak var populationArea: UILabel!
    @IBOutlet weak var populationAreaResponse: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageResponse: UILabel!
    @IBOutlet weak var bordersLabel: UILabel!
    @IBOutlet weak var bordersResponse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts(text: countryCommonName)
//                configurationViewModel()
        colorfulView.layer.borderWidth = 1.5
        colorfulView.layer.borderColor = UIColor.black.cgColor
        initila()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MainPageController") as! MainPageController
//        show(controller, sender: nil)
//        navigationController?.popToRootViewController(animated: true)
        print("Fsafd")
        self.navigationController?.popViewController(animated: true)
//        navigationController?.show(controller, sender: nil)
    }
    //    private func configurationViewModel() {
    //        showLoader()
    //        viewModel.getDetailResults(text: countryCommonName)
    //        viewModel.errorCallback = { message in
    //            self.dismissLoader()
    //            self.showAlert(message: message) {}
    //        }
    //
    //        viewModel.successCallback = {
    //            self.dismissLoader()
    //        }
    //    }
    
    func getPosts(text : String) {
        guard let url = URL(string: "https://restcountries.com/v3.1/name/\(text)") else {return}
        AF.request(url, method: .get).responseData { response in
            do {
                let posts = try JSONDecoder().decode(([CountryElement].self), from: response.data ?? Data())
                self.listItems = posts
                print(posts)
                print(self.listItems.count)
                self.initila()
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func initila() {
        for user in self.listItems{
            if user.name?.common == countryCommonName{
                print(countryCommonName)
                print(user.name?.common ?? "")
                navLabel.text = user.name?.common
                countryName.text = user.name?.common
                flagImage?.text = user.flag
                regionResponse.text = user.region?.rawValue
                areaResponse.text = "\(user.area ?? 0.0) km2"
                
                let a = user.population ?? 0
                let y = Int(a / 1000000)
                populationResponse.text = "\(y) mln"
                
                currencyResponse.text = user.fifa
                capitalResponse.text = user.capital?.first
                timezoneResponse.text = user.timezones?.first
                populationAreaResponse.text = user.capital?.first
                languageResponse.text = user.languages?.keys.first
                bordersResponse.text = user.borders?.joined(separator: ", ")
            }
        }
    }
}
