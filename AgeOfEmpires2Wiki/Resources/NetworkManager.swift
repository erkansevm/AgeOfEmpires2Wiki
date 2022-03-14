//
//  NetworkManager.swift
//  AgeOfEmpires2Wiki
//
//  Created by Erkan Sevim on 24.02.2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseUrl = "https://age-of-empires-2-api.herokuapp.com/api/v1/"
  

    public func getCivs(completion: @escaping ((Result<Civilizations, Error>) -> Void)){
        let urlString = "\(baseUrl)civilizations"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.failedToFetch))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error!)
                completion(.failure(NetworkError.failedToFetch))
                return
            }
            
            let decoder = JSONDecoder()
            let civs = try! decoder.decode(Civilizations.self, from: data)
            completion(.success(civs))
        }
        
        task.resume()
    }

    public func getUnit(with url: String, completion: @escaping ((Result<Unit, Error>) -> Void)) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.failedToFetch))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error!)
                completion(.failure(NetworkError.failedToFetch))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let unit = try! decoder.decode(Unit.self, from: data)
            completion(.success(unit))
        }
        
        task.resume()
    }
}


enum NetworkError: Error {
    case failedToFetch
}

struct Civilizations: Codable {
    let civilizations: [Civilization]
}
