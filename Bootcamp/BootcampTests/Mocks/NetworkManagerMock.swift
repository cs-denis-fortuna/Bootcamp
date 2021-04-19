//
//  NetworkManagerMock.swift
//  BootcampTests
//
//  Created by denis.fortuna on 14/04/21.
//

@testable import Bootcamp

final class NetworkManagerMock: NetworkManagerProtocol {
    
    var callRequestWithService: ServiceProtocol?
    
    func request<T>(service: ServiceProtocol, responseType: T.Type, callback: @escaping (Result<T, MagicError>) -> Void) where T : Decodable {
        callRequestWithService = service
    }
}
