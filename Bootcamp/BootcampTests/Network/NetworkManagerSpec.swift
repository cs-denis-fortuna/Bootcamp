//
//  NetworkManagerSpec.swift
//  BootcampTests
//
//  Created by denis.fortuna on 14/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Bootcamp

class NetworkManagerSpec: QuickSpec {
    
    override func spec() {
        
        describe("NetworkManager") {
            var sut: NetworkManager!
            var requestData: Data!
            
            context("decode()") {
                
                beforeEach {
                    sut = NetworkManager()
                    let jsonString = SetsResponseJson().sets
                    requestData = Data(jsonString.utf8)
                }
                
                it("decodes Json to CardSet objects properly") {
                    let decodedJson = decode(data: requestData, returmningType: Sets.self)
                    expect(decodedJson).notTo(beNil())
                    expect(decodedJson?.sets.count).to(equal(2))
                }
            }
            func decode<T: Decodable>(data: Data, returmningType: T.Type) -> T? {
                guard let decodedJson: T = sut.decode(data: data) else { return nil }
                return decodedJson
            }
        }
    }
}
