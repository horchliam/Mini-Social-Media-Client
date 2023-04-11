//
//  CreateUserService.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/3/23.
//

import Foundation

struct CreateUserResponse: Decodable {
    let userId: Int
}

class CreateUserService {
    func createUser(username: String, profilePic: String, _ onComplete: @escaping (Int) -> ()) {
        guard let url = URL(string: Config.url + "/User") else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let json: [String: String] = ["username": username, "profilePic": profilePic]
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
                        let response: [CreateUserResponse] = try! JSONDecoder().decode([CreateUserResponse].self, from: data)
                        print(response[0].userId)
                        onComplete(response[0].userId)
                    } else {
                        print("Error decoding: ", error ?? "")
                    }
                }
            }
        }

        dataTask.resume()
    }
}
