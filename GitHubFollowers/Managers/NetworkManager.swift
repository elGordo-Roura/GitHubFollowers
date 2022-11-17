//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Christopher J. Roura on 11/16/22.
//

import Foundation
import ElGordoRouraTools

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseUrl = "https://api.github.com/"
    private let perPageFollower = 100
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], CRError>) -> Void) {
        let endpoint = baseUrl + "users/\(username)/followers?per_page=\(perPageFollower)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try decoder.decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
