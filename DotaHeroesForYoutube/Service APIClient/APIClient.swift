//
//  APIClient.swift
//  DotaHeroesForYoutube
//
//  Created by Serxhio Gugo on 10/21/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

class APIClient: NSObject {
    
    static let shared = APIClient()
    private let baseUrl = "https://api.opendota.com/"
    
    func fetchDotaHeroes(path: String, completion: @escaping ([Heroes]? , Error?) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)\(path)") else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                print("Error fetching users", error)
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(nil, error)
                print("Server bad reponse 404")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let heroes = try JSONDecoder().decode([Heroes].self, from: data)
               
                DispatchQueue.main.async {
                    completion(heroes, nil)
                }
                
            } catch let jsonError{
                print("Failed to decode: ", jsonError)
            }
            
        }.resume()
    }
}
