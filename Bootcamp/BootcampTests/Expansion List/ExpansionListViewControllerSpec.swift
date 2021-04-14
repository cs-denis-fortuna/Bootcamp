//
//  ExpansionListViewControllerSpec.swift
//  BootcampTests
//
//  Created by denis.fortuna on 14/04/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Bootcamp

class ExpansionListViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("ExpansionListViewController") {
            var sut: ExpansionListViewController!
            var networkMock: NetworkManagerMock!
            
            context("viewDidLoad") {
                
                beforeEach {
                    networkMock = NetworkManagerMock()
                    sut = ExpansionListViewController(networkManager: networkMock)
                    sut.viewDidLoad()
                }
                
                it("calls request on networkManager with right MagicService path") {
                    let expectedService = MagicService.sets
                    let calledService = networkMock.callRequestWithService
                    
                    expect(calledService?.path).to(equal(expectedService.path))
                }
            }
        }
    }
}
