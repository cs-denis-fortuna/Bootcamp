//
//  ExpansionCoordinatorSpec.swift
//  Bootcamp
//
//  Created by denis.fortuna on 16/04/21.
//

import Quick
import Nimble

@testable import Bootcamp

class ExpansionCoordinatorSpec: QuickSpec {
    
    override func spec() {
        
        describe("ExpansionCoordinator") {
            var sut: ExpansionCoordinator!
            var sutStart: UIViewController!
            
            context("RootViewController") {
                
                beforeEach {
                    sut = ExpansionCoordinator()
                    sutStart = sut.start(with: .push)
                }
                
                it("Coordinator returns a NavigationController with only ExpansionListViewController in it's stack") {
                    expect(sutStart is UINavigationController).to(equal(true))
                    expect((sutStart as? UINavigationController)?.viewControllers.count).to(equal(1))
                    expect((sutStart as? UINavigationController)?.viewControllers[0] is ExpansionListViewController).to(equal(true))
                }
            }
            
            context("didSelectExpansion") {
                
                beforeEach {
                    sut = ExpansionCoordinator()
                    sutStart = sut.start(with: .push)
                    let cardSet = CardSet(code:"10E", name: "Tenth Edition", type: "core", border: nil, mkmId: nil, mkmName: nil, releaseDate: "2007-07-13", magicCardsInfoCode: nil, block: "Core Set", onlineOnly: false)
                    sut.didSelectExpansion(cardSet)
                }
                
                it("Coordinator returns a NavigationController with only ExpansionListViewController in it's stack") {
                    expect(sutStart is UINavigationController).to(equal(true))
                    expect(sut.navigationController?.viewControllers.count).to(equal(2))
//                    expect((sutStart as? UINavigationController)?.viewControllers.count).to(equal(2))
//                    expect((sutStart as? UINavigationController)?.viewControllers[0] is ExpansionListViewController).to(equal(true))
                }
            }
        }
    }
}
