//
//  NetworkManager.swift
//  appLoginEbac
//
//  Created by Gilmar Junior on 28/08/22.
//

import Foundation

enum ResultNewsError: Error{
    case badURL, noData, invalidJSON
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    struct Constants {
        static let newsAPI = URL(string: "https://web-ebac-ios.herokuapp.com/home")
    }
    
    private init(){ }
    
    func getNews(completion: @escaping (Result<[ResultNews], ResultNewsError>) -> Void) {
        
        guard let url = Constants.newsAPI else {
            completion(.failure(.badURL))
            return
        }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(.failure(.invalidJSON))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseElement.self, from: data)
                completion(.success(result.home.results))
            } catch {
                print("Error info:\(error.localizedDescription)")
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
    
}
