//
//  NetworkManager.swift
//  Country App
//
//  Created by Vasif Mehdi on 14.11.22.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    var listItems : Welcome?
    
    
    func requestWithBody<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url,
                   method: method).responseData { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data : data) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.generalError))
            }
        }
    }
    
    func requestWithoutBody<T: Codable>(type: T.Type, url: String, method: HTTPMethod, completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url,
                   method: method).responseData { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data : data) { response in
                    completion(response)
                }
            case .failure(_):
                completion(.failure(.generalError))
            }
        }
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data, completion: @escaping((Result<T, ErrorTypes>)->())) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.invalidData))
        }
    }
    
    
//    func getMethod() {
//        AF.request("https://jsonplaceholder.typicode.com/posts", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
//            switch response.result {
//                case .success(let data):
//                print(response)
//                    do {
//                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//                            print("Error: Cannot convert data to JSON object")
//                            return
//                        }
//                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                            print("Error: Cannot convert JSON object to Pretty JSON data")
//                            return
//                        }
//                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
//                            print("Error: Could print JSON in String")
//                            return
//                        }
//
//                        print(prettyPrintedJson)
//                    } catch {
//                        print("Error: Trying to convert JSON data to string")
//                        return
//                    }
//                case .failure(let error):
//                    print(error)
//            }
//        }
//    }
    
//    func getRequest() {
//        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get, encoding: JSONEncoding.default).responseJSON { response in
//            switch response.result {
//            case .success(let json) :
//                print(json)
//                DispatchQueue.main.async {
//
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
//    func postRequest() {
//       let body : [String : Any] = ["usernameOrEmail" :  "Vasif", "password": "123"]
//
//
//      let url = URL(string: "http://faradheus-001-site1.itempurl.com/api/Account/login")!
//      AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default)
//        .validate()
//        .responseJSON { response in
//          switch response.result {
//          case .success(let response):
//            print(response)
//          case .failure(let error):
//            print(error.localizedDescription)
//          }
//      }
//    }
    
    
//    func getPosts() {
//        let session = URLSession.shared
//        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
//        request.httpMethod = "GET"
//        session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                print("error: \(error.localizedDescription)")
//            } else if let data = data {
//                do { let posts = try JSONDecoder().decode(([Element].self), from: data)
//                    DispatchQueue.main.async {
//                        self.listItems = posts
//                    }
//                }
//                catch {
//                    print("error: \(error.localizedDescription)")
//                }
//            }
//            else {
//                print("dsada")
//            }
//        }.resume()
    
    func getPosts(body : [String : Any]) {

        guard let url = URL(string: "https://reqres.in/api/users") else {return}
                AF.request(url, method: .post, parameters: body).responseData { response in
                    do {
                        let posts = try JSONDecoder().decode((Welcome.self), from: response.data ?? Data())
                            self.listItems = posts
                        print(body)
                    }
                    catch {
                        print("error: \(error.localizedDescription)")
                    }
                }
            }
}
