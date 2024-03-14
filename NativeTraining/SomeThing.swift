//
//  SomeThing.swift
//  swift_learning
//
//  Created by Mai Xuân Duy on 12/03/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    
    private let domainUrlString = "https://api.github.com/users"
    
    func fetchData(fromIndex: Int, completionHandler: @escaping ([Person]) -> Void) {
        let url = URL(string: domainUrlString + "?since=\(fromIndex)")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching index: \(fromIndex): \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data,
               let jSOnData = try? JSONDecoder().decode([Person].self, from: data) {
                completionHandler(jSOnData)
            }
        })
        task.resume()
    }
    
    func fetchData(userId: String, completionHandler: @escaping (Person) -> Void) {
        let url = URL(string: domainUrlString + "/\(userId)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error returning userId: \(userId) : \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected response status code: \(String(describing: response))")
                return
            }
            
            if let data = data,
               let jSOnData = try? JSONDecoder().decode(Person.self, from: data) {
                completionHandler(jSOnData)
            }
        }
        task.resume()
    }
    
    func fetchRepoData(userId: String, completionHandler: @escaping ([Project]) -> Void) {
        let url = URL(string: domainUrlString + "/\(userId)/repos")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching index: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let data = data,
               let jSOnData = try? JSONDecoder().decode([Project].self, from: data) {
                completionHandler(jSOnData)
            }
        })
        task.resume()
    }
    
    func loadImageFromURL(urlString: String, completionHandler: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error ?? "unknown error")
                return
            }
            
            guard let data = data else {
                print("No data found")
                return
            }
            guard let loadedImage = UIImage(data: data) else { return }
            completionHandler(loadedImage)
            
        }.resume()
    }
    
}

struct Person: Decodable {
    let login: String
    let id: Int
    let avatar_url: String?
    let location: String?
    let name: String?
    let followers: Int?
    let following: Int?
    let public_repos: Int?
    let company: String?
    let blog: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatar_url
        case location
        case name
        case followers
        case following
        case public_repos
        case company
        case blog
    }
}

struct Project: Decodable {
    let id: Int
    let name: String?
    let language: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case language
        case description
    }
}
