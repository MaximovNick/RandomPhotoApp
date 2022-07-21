//
//  NetworkManager.swift
//  RandomPhotoApp
//
//  Created by Nikolai Maksimov on 21.07.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    let urlString = "https://source.unsplash.com/random/600x600"
    
    static let shared = NetworkManager()
    private init(){}
    
    func fetchImage(completion: @escaping(Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
          
        }.resume()
    }
}
