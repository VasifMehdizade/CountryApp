//
//  DetailController.swift
//  Country App
//
//  Created by Vasif Mehdi on 18.12.22.
//

import UIKit
import Alamofire
import SDWebImage
import MapKit

class DetailController: UIViewController , CLLocationManagerDelegate {
    
    var countryCommonName = ""
    
    var listItems = [CountryElement]()
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
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
        locationManager.delegate = self
        getPosts(text: countryCommonName)
        colorfulView.layer.borderWidth = 1.5
        colorfulView.layer.borderColor = UIColor.black.cgColor
        initila()
//        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
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
        for item in self.listItems{
            if item.name?.common == countryCommonName{
                navLabel.text = item.name?.common
                countryName.text = item.name?.common
                flagImage?.text = item.flag
                regionResponse.text = item.region?.rawValue
                areaResponse.text = "\(item.area ?? 0.0) km2"
                
                let a = item.population ?? 0
                let y = Int(a / 1000000)
                populationResponse.text = "\(y) mln"
                
                currencyResponse.text = item.fifa
                capitalResponse.text = item.capital?.first
                timezoneResponse.text = item.timezones?.first
                populationAreaResponse.text = item.capital?.first
                languageResponse.text = item.languages?.keys.first
                bordersResponse.text = item.borders?.joined(separator: ", ")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for locationStruct in listItems{

            let coordinate = CLLocationCoordinate2D(latitude: locationStruct.latlng?[0] ?? 0.0, longitude: locationStruct.latlng?[1] ?? 0.0)
            print(coordinate)
            print(coordinate.longitude)
                
                _ = MKCoordinateSpan(latitudeDelta: 10000, longitudeDelta: 10000)
                manager.stopUpdatingLocation()
                //            let region = MKCoordinateRegion(center: coordinate, span: span)
                let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: 100000)
                
                mapView.setRegion(region, animated: true)
            }
        }
    }
