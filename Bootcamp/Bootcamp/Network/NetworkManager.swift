//
//  NetworkManager.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

final class NetworkManager {
    
    func request<T: Decodable>(fromUrl url: MagicService,
                               responseType: T.Type,
                               callback: @escaping (Result<T, Error>) -> Void) {
        if let url = URL(string: url.path) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if error != nil {
                    callback(.failure(NSError()))
                    return
                }
                if let data = data {
                    guard let object: T = self?.decode(data: data) else {
                        callback(.failure(NSError()))
                        return
                    }
                    callback(.success(object))
                }
            }
            task.resume()
        }
    }
    
    private func decode<T: Decodable>(data: Data) -> T?{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return object
    }
}
