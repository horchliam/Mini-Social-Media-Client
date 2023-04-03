//
//  GetPostsService.swift
//  TwitterEsqueApp
//
//  Created by Liam Horch on 4/3/23.
//

import Foundation

class GetPostsService {
    func getPosts(_ completion: @escaping ([UserPost]) -> ()) {
        guard let url = URL(string: Config.url + "/Posts") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedPosts = try JSONDecoder().decode([UserPost].self, from: data)
                        completion(decodedPosts)
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
