//
//  Service.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation

class Service {
    
    typealias News = Result<SearchResults, CryptoNewsErrors>

    func fetchNews(completion: @escaping (News) -> Void) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2022-12-03&sortBy=publishedAt&apiKey=199e8836528a49c1848b82bd93e26341"
        guard let url = URL(string: urlString) else {
            completion(.failure(CryptoNewsErrors.networkError))
            print(urlString)
            return
        }
        fetchGenericJSONData(url: url, completion: completion)
    }
    
    private func fetchGenericJSONData<T: Decodable>(url: URL, completion: @escaping (Result<T, CryptoNewsErrors>) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                completion(.failure(CryptoNewsErrors.networkError))
            }
            guard let httpReponse = response as? HTTPURLResponse, (200...299).contains(httpReponse.statusCode) else {
                completion(.failure(CryptoNewsErrors.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(CryptoNewsErrors.networkError))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let objects = try decoder.decode(T.self, from: data)
                completion(.success(objects))
                
            } catch {
                print(error)
                completion(.failure(CryptoNewsErrors.networkError))
            }
        }
        task.resume()
    }
}



