//
//  CreatePostService.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/3/23.
//

import Foundation

class CreatePostService {
    func createPost(userId: Int, message: String) {
        guard let url = URL(string: Config.url + "/Post") else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let json: [String: Any] = ["userId": userId, "message": message]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        urlRequest.httpBody = jsonData

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    if let dataString = String(data: data, encoding: .utf8) {
                        print(dataString)
                    } else {
                        print("Error decoding: ", error ?? "")
                    }
                }
            }
        }

        dataTask.resume()
    }
}
