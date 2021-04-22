//
//  NetworkManager.swift
//  Bootcamp
//
//  Created by denis.fortuna on 12/04/21.
//

import Foundation

enum MagicError: Error {
    case failure
    case notFound
}

protocol NetworkManagerProtocol {
    func request<T: Decodable>(service: ServiceProtocol,
                               responseType: T.Type,
                               callback: @escaping (Result<T, MagicError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    func request<T: Decodable>(service: ServiceProtocol,
                               responseType: T.Type,
                               callback: @escaping (Result<T, MagicError>) -> Void) {
        if let url = URL(string: service.path) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if error != nil {
                    callback(.failure(MagicError.failure))
                    return
                }
                if let httpResponde = response as? HTTPURLResponse, httpResponde.statusCode  > 299  {
                    print("HTTP URL RESPONSE Code", httpResponde.statusCode, httpResponde.description)
                    callback(.failure(MagicError.notFound))
                }
                if let data = data {
                    guard let object: T = self?.decode(data: data) else {
                        callback(.failure(MagicError.failure))
                        return
                    }
                    callback(.success(object))
                }
            }
            task.resume()
        }
    }
    
    func decode<T: Decodable>(data: Data) -> T?{
        let decoder = JSONDecoder()
        guard let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }
        return object
    }
}
