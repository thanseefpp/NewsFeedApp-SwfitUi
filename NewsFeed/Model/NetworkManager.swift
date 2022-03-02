//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by THANSEEF on 02/03/22.
//

import Foundation

// ObservableObject inheriting

class NetworkManager : ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                }else{
                    let decorder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decorder.decode(NewsData.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                // assigning values to posts from the json decoded data.
                                self.posts = result.hits
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
