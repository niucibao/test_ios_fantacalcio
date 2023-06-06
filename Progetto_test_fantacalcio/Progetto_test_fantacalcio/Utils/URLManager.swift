//
//  URLManager.swift
//  Progetto_test_fantacalcio
//
//  Created by Nicola Lauritano on 05/06/23.
//

import Foundation

class URLManager {
    
    //Singleton used for cache
    static func getList(onSuccess: (@escaping ([Player])->()), onError: @escaping ((Error)->())) {
        guard let url = URL(string: "https://content.fantacalcio.it/test/test.json") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                onError(error)
            } else {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        let decoder = JSONDecoder()
                        do {
                            let result = try decoder.decode([Player].self, from: data!)
                            onSuccess(result)
                        } catch {
                            onError(error)
                        }

                    } else {
//                        onError?(error)
                    }
                }
            }
        }.resume()
        
        
    }
    
}
