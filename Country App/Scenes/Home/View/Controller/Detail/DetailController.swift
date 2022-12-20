//
//  DetailController.swift
//  Country App
//
//  Created by Vasif Mehdi on 18.12.22.
//

import UIKit
import Alamofire

class DetailController: UIViewController {
    
    var countryCommonName = ""
    
    var listItems = [DetailElement]()
    
    var allDays = ""
    
    
    //    var variable = listItems
    
    //    var viewModel = DetailViewModel()
    
    @IBOutlet weak var navLabel: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionResponse: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var areaResponse: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var populationResponse: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyResponse: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var capitalResponse: UILabel!
    @IBOutlet weak var timezoneLabel: UILabel!
    @IBOutlet weak var timezoneResponse: UILabel!
    @IBOutlet weak var populationArea: UILabel!
    @IBOutlet weak var populationAreaResponse: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageResponse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts(text: countryCommonName)
        //        configurationViewModel()
        initila()
        
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
                let posts = try JSONDecoder().decode(([DetailElement].self), from: response.data ?? Data())
                self.listItems = posts
                print(posts)
                print(self.listItems)
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    func initila() {
        let num = listItems[0].name.common
        navLabel.text = num
    }
    
}
