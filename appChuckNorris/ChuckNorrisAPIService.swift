//
//  ChuckNorrisAPIService.swift
//  appChuckNorris
//
//  Created by jimbo on 17/12/24.
//

import Foundation


import Foundation

class ChuckNorrisService {
    
    private let baseUrl = "https://api.chucknorris.io"
    
    func fetchRandomJoke(completion: @escaping (String?) -> Void) {
        let url = URL(string: "\(baseUrl)/jokes/random")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let jokeResponse = try JSONDecoder().decode(JokeResponse.self, from: data)
                completion(jokeResponse.value)
            } catch {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let url = URL(string: "\(baseUrl)/jokes/categories")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let categories = try JSONDecoder().decode([String].self, from: data)
                completion(categories)
            } catch {
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func fetchJokeByCategory(category: String, completion: @escaping (String?) -> Void) {
        let url = URL(string: "\(baseUrl)/jokes/random?category=\(category)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let jokeResponse = try JSONDecoder().decode(JokeResponse.self, from: data)
                completion(jokeResponse.value)
            } catch {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
